Feature: Running pick color functions
  As AnaDraw developer
  I want to have a pick color feature file
  So I can begin testing by picking from swatch, slots, canvas

  Background:
    Given I start to edit a new file in the Paint Screen
    

  Scenario: Painting pick a color quickly from ColorPicker
    When I touch the "UsingColor" button
    Then I wait to see ColorPicker
    When I pick red in the ColorPicker
    And I confirm the pick
    Then I am using red color
  
  Scenario: Painting pick a color in simple mode from swatch
    Given this is pending

  Scenario Outline: Painting pick a color on swatch
    When I touch color slot number <num> on swatch
    Then I am using number <num> color from swatch
    Examples:
    | num |
    | 1   |
    | 2   |
    
  Scenario: Painting edit a color slot on swatch
    Given this is pending  
  
  Scenario Outline: Painting pick a color from a eye dropper
    Given I should see a "EyeDropper" button
    When I touch the "EyeDropper" button
    And I touch up screen <x> from the left and <y> from the top
    Then I wait to see "Magnifier"
    And I wait
    And I am on the Paint Screen
    And I am using color from Magnifier
    
    Examples:
    | x   | y   |
    | 384 | 512 |
    
@focus    
  Scenario Outline: Painting pick a color directly from canvas
    Given this is pending
    #When I long press on screen <x> from the left and <y> from the top
    
    Examples:
    | x   | y   |
    | 384 | 512 |    
  
  Scenario: Painting save using color to a color slot
    Given this is pending
