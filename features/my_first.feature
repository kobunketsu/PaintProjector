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
  And I should see a "Print" button
  
  Then I touch the "Back" button
  And I wait until I don't see "Back"
  And I wait until I don't see "New"
  And I wait until I don't see "Copy"
  And I wait until I don't see "Delete"
  And I wait until I don't see "Print"
  
  Then I should see a "Anamorphic World" button
  And I should see a "My Artwork" button
  And I should see a "Setup" button

Scenario: First Screen create and paint a new artwork
  Given I see ArtworkTools
  And I should see a "New" button
  Then I touch the "New" button
  And I wait for "PaintScreen" to appear


Scenario: First Screen delete an artwork
  Given I see ArtworkTools
  Given I see at least one artworks
  Then I delete paint number 1


