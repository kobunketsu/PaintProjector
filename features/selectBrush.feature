Feature: Running select brush functions
  As AnaDraw developer
  I want to have a select brush feature file
  So I can begin testing

  Background:
  Given I start to edit a new file in the Paint Screen
      
  Scenario Outline: Painting select brush from brush category
    Then I should see a "UsingBrush" button
    When I touch the "UsingBrush" button
    Then I wait to see "Brushs"
    When I try to find <brush>
    Then I touch the <brush> button
    And I wait to not see "Brushs"
    And I am using the <brush>
  
    Examples:
    | brush          |
    | "Pencil"       |
    | "Eraser"       |
    | "Pen"          |
    | "Marker"       |
    | "Finger"       |
    | "ChineseBrush" |
    | "Crayons"      |
    | "Bucket"       |
    | "InkPen"       |
    | "MarkerSquare" |
    | "OilBrush"     |
    | "AirBrush"     |
  

  Scenario Outline: Painting switch using brush to backup brush
    Given I am using the <usingBrush>
    And I am backuping the <backupBrush>
  
    #backupBrush should not be hidden
    When I touch hidden "BackupBrush"
    Then I am using the <backupBrush>
    And I am backuping the <usingBrush>
  
    Examples:
    | usingBrush | backupBrush |
    | "Pencil"   | "Eraser"    |
  
 
