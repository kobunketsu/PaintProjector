Feature: Running a test
  As an iOS developer
  I want to have a sample feature file
  So I can begin testing functions like preview, new, copy, delete, print

  Background:
    Given I am on the Gallery Screen
    #view more artwork in gallery
    Then I should see a "Manage" button
    Then I should see a "New" button

  Scenario: view a paint in anamorphosis modetrans
    Given I see paint number <num>
    When I touch paint number <num>
    Then I transition from "GalleryScreen" to "AnamorphosisScreen"
          
  Scenario: new a file and paint
    When I touch the "New" button
    Then I wait to see "PaintScreen"

  Scenario Outline: copy a paint
    When I touch the "Manage" button
    Then I enter Setup mode
    Given I see paint number <num>
    When I touch paint number <num>
    And I touch the "Copy" button
    Then I copy paint number <num>
    Examples:
    | num |
    | 1   |
    
  Scenario Outline: copy a paint <multiple> times
  Given this is pending
    Examples:
    
  Scenario Outline: copy multiple paints
    When I touch the "Manage" button
    Then I enter Setup mode
    Given I see paint number <num1>
    And I see paint number <num2>    
    When I touch paint number <num1>
    And I touch paint number <num2>
    When I touch the "Copy" button
    Then I copy paint number <num1>
    And I copy paint number <num1>    
    Examples:
    | num1 | num2 |
    | 1    | 2    |
    
  Scenario Outline: copy multiple paints <multiple> times
    Given this is pending
    Examples:    
        
  Scenario Outline: delete a paint
    When I touch the "Manage" button
    Then I enter Setup mode
    Given I see paint number <num>
    When I touch paint number <num>
    And I touch the "Delete" button
    Then I delete paint number <num>
    Examples:
    | num |
    | 1   |

  Scenario Outline: delete multiple paints
    When I touch the "Manage" button
    Then I enter Setup mode
    Given I see paint number <num1>
    And I see paint number <num2>    
    When I touch paint number <num1>
    And I touch paint number <num2>    
    And I touch the "Delete" button
    Then I delete paint number <num1>
    And I delete paint number <num2>
    Examples:
    | num1 | num2 |
    | 1    | 2    |
  
  Scenario Outline: print a paint quickly
    When I touch the "Manage" button
    Then I enter Setup mode
    Given I see paint number <num>
    When I touch paint number <num>
    And I touch the "Printer" button
    Then I wait to see "Printer Options"
    And I wait to see "More info"
    When I touch the "More info" button
    Then I wait to see "No AirPrint Printers Found"
    #no printer available
    Examples:
    | num |
    | 1   |
  
  
#  Scenario: First Screen select first artwork to paint
#    Given I see at least one artworks
#  
#    Then I touch list item number 1
#
#    Then I wait for the "Draw" button to appear
#    Then I touch the "Draw" button
#    Then I wait to see "PaintScreen"
