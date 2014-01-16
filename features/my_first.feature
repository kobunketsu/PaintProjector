Feature: Running a test
  As an iOS developer
  I want to have a sample feature file
  So I can begin testing quickly


Scenario: First Screen apperance
  Given I am on the Welcome Screen
  Then I should see a "Anamorphic World" button
  And I should see a "My Artwork" button
  And I should see a "Setup" button
  
Scenario: First Screen forward to ArtworkTools and back
  Then I touch the "My Artwork" button
  And I wait until I don't see "Anamorphic World"
  And I wait until I don't see "My Artwork"
  And I wait until I don't see "Setup"
  
  Then I should see a "Back" button
  And I should see a "New" button
  And I should see a "Copy" button
  And I should see a "Delete" button
  And I should see a "Printer" button
  
  Then I touch the "Back" button
  And I wait until I don't see "Back"
  And I wait until I don't see "New"
  And I wait until I don't see "Copy"
  And I wait until I don't see "Delete"
  And I wait until I don't see "Printer"
  
  Then I should see a "Anamorphic World" button
  And I should see a "My Artwork" button
  And I should see a "Setup" button

Scenario: First Screen create and paint a new artwork
  Given I see ArtworkTools
  And I should see a "New" button
  Then I touch the "New" button
  Then I wait to see "PaintScreen"

Scenario: First Screen copy first artwork
  Given I see ArtworkTools
  Given I see at least one artworks
  Then I copy paint number 1

Scenario: First Screen copy 3 copys of first artwork
  Given I see ArtworkTools
  Given I see at least one artworks
  Then I copy paint number 1 repeat 3 times
        
Scenario: First Screen delete first artwork
  Given I see ArtworkTools
  Given I see at least one artworks
  Then I delete paint number 1

Scenario: First Screen quick print first artwork 
  Given I see ArtworkTools
  Given I see at least one artworks
  
  Then I touch list item number 1
  
  Then I wait for the "Printer" button to appear
  Then I touch the "Printer" button
  
  Then I wait to see "Printer Options"
  And I wait to see "More info"
  And I touch the "More info" button

  When I wait to see "No AirPrint Printers Found"
  #no printer available

Scenario: First Screen select first artwork to paint
  Given I see ArtworkTools
  Given I see at least one artworks
  
  Then I touch list item number 1

  Then I wait for the "Draw" button to appear
  Then I touch the "Draw" button
  Then I wait to see "PaintScreen"

Scenario: Painting select pencil brush
  Given I see ArtworkTools
  And I should see a "New" button
  Then I touch the "New" button
  Then I wait to see "PaintScreen"
  Then I am on the Paint Screen
  Then I wait for the "Using Brush" button to appear
  Then I touch the "Using Brush" button
  Then I wait to see "Brushs"
  And I should see a "Pencil" button
  Then I touch the "Pencil" button
  Then I wait to not see "Brushs"
  And I am on the Paint Screen

  
  
  
  
  
 
  