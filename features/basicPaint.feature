Feature: Running misc functions
  As AnaDraw developer
  I want to have misc feature file
  So I can begin testing

  Background:
    Given I start to edit a new file in the Paint Screen
    
  Scenario: paint on full screen
    Given I am on the Paint Screen
    And I should see a "FullScreen" button
    When I touch the "FullScreen" button
    Then I enter FullScreen
