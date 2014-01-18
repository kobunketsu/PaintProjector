Feature: Running pick color functions
  As AnaDraw developer
  I want to have a pick color feature file
  So I can begin testing by picking from pallete, slots, canvas

Scenario: Painting pick a color quickly from pallete
  Given I start to edit a new file in the Paint Screen
  When I touch the "UsingColor" button
  Then I wait to see Pallete
  When I pick red in the pallete
  And I confirm the pick
  Then I am using the picked color
  
Scenario: Painting pick a color in simple mode from pallete
 
Scenario: Painting pick a color from a color slot

Scenario: Painting pick a color from a eye dropper

Scenario: Painting pick a color directly from canvas

Scenario: Painting save using color to a color slot

Scenario: Painting edit a color slot from pallete