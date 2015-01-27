Feature: Running share image functions
  As AnaDraw developer
  I want to have a export image feature file
  So I can begin testing

  Background:
    Given I am on the Anamorphosis Screen
    #if user like the artwork, share it by facebook, twitter, pinterest, sina weibo or more
    And I should see a "Share" button
    Given I touch the "Share" button
    Then I wait to see "ShareList"
      
  Scenario: share image in png format to email
    Given I should see a "Email" button
    When I touch the "Email" button
    
  Scenario: share image in png format to facebook
    Given I should see a "Facebook" button  
    When I touch the "Facebook" button
    
  Scenario: share image in png format to twitter
    Given I should see a "Twitter" button  
    When I touch the "Twitter" button
    
  Scenario: share image in png format to pinterest
    Given I should see a "Pinterest" button  
    When I touch the "Pinterest" button
    
  Scenario: share image in png format to sina weibo
    Given I should see a "Sina" button  
    When I touch the "Sina" button