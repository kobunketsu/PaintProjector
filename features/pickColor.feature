Feature: Running pick color functions
  As AnaDraw developer
  I want to have a pick color feature file
  So I can begin testing by picking from pallete, slots, canvas

  Background:
    Given I start to edit a new file in the Paint Screen
    
@focus
  Scenario: Painting pick a color quickly from ColorPicker
    When I touch the "UsingColor" button
    Then I wait to see ColorPicker
    When I pick red in the ColorPicker
    And I confirm the pick
    Then I am using red color
  
  Scenario: Painting pick a color in simple mode from pallete
    Given this is pending

  Scenario Outline: Painting pick a color on pallete
    When I touch color slot number <num> on pallete
    Then I am using number <num> color from pallete
    Examples:
    | num |
    | 1   |
    | 2   |
  
  Scenario Outline: Painting edit a color slot on pallete
    Given this is pending
    Examples:
  
  Scenario: Painting pick a color from a eye dropper
    Given this is pending
  
  Scenario: Painting pick a color directly from canvas
    Given this is pending
  
  Scenario: Painting save using color to a color slot
    Given this is pending

