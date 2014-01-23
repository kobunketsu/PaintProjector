Feature: Running a test
  As an iOS developer
  I want to have a sample feature file
  So I can begin testing functions like go to gallery, add cylinder mirror, share, special print, and paint

  Background:
    Given I am on the Anamorphosis Screen
    #view more artwork in gallery
    Then I should see a "Gallery" button
    #print artwork in anamorphosis mode, add some specific print params besides basic params
    And I should see a "Print" button
    #add virtual mirror and simulate view perspective if user do not have a real mirror
    And I should see a "CylinderMirror" button
    #paint the artwork directly
    And I should see a "Paint" button
    #if user like the artwork, share it by facebook, twitter, pinterest, sina weibo or more
    And I should see a "Share" button
    
  Scenario: go to gallery
    When I touch the "Gallery" button
    Then I transition from "AnamorphosisScreen" to "GalleryScreen"

  Scenario: add cylinder mirror to simulate how to see anamorphosis art
    When I touch the "CylinderMirror" button
  
  Scenario Outline: print the paint in anamorphosis mode, user can setup params for printing like size, view angle etc. 
    When I touch the "Printer" button
    Then I wait to see "AnamorphosisPanel"
    And I wait to see "Width" slider
    And I wait to see "Height" slider
    And I wait to see "ViewAngle" slider
    When I slide "<param>" to <value>
    Then I should see other sliders change corespondly
    When I touch the "Print" button
    Then I wait to see "Printer Options"
    And I wait to see "More info"
    When I touch the "More info" button
    Then I wait to see "No AirPrint Printers Found"
    Examples:
    | param | value |
    | Width | 1     |
          
  Scenario: share the paint to social network by email, facebook, twitter, pinterest, weibo
  #Run in share.features
         
  Scenario: paint the anamorphosis
    When I touch the "Paint" button
    Then I transition from "AnamorphosisScreen" to "PaintScreen"
    
