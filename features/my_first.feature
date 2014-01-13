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

Scenario: First Screen create an new file to paint
  Given I see ArtworkTools
  And I should see a "New" button
  Then I touch the "New" button
  And I wait for "PaintScreen" to appear

Scenario: First Screen pick an artwork to paint
  Given I see at least one artworks
  Given I see ArtworkTools


