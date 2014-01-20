Feature: Running manage layer functions
  As AnaDraw developer
  I want to have a manager layer feature file
  So I can begin testing by create delete copy move layer

  Background:
    Given I start to edit a new file in the Paint Screen
    And I should see a "Layer" button
    When I touch the "Layer" button
    Then I wait to see "LayerManager"
    
  Scenario Outline: Painting create new layer above selected layer
    Given I should see layer number <num>
    And I touch layer number <num>
    When I touch New button for layer number <num>
    Then I should create a new layer above
    Examples:
    | num |
    | 1   |
        
  @focus    
  Scenario Outline: Painting delete selected layer
    Given I should see layer number <num>
    When I touch Delete button for layer number <num>
    Then I should delete layer number <num>
    Examples:
    | num |
    | 2   |
    
  Scenario Outline: Painting copy selected layer
    Given I should see layer number <num>
    And I touch layer number <num>
    When I touch Copy button for layer number <num>
    Then I should copy layer number <num> above
    Examples:
    | num |
    | 1   |

  Scenario Outline: Painting move layer up and down
    Given I should see layer number <from>
    And I should see layer number <to>
    When I drag ReorderControl of layer number <from> above layer number <to>
    Then I should move layer number <num> above layer number <to>
    Examples:
    | from | to |
    | 1    | 2  |
        
  Scenario Outline: Painting merge down selected layer
    Given I should see layer number <num>
    When I touch Merge button for layer number <num>
    Then I should merge layer number <num> down
    Examples:
    | num |
    | 2   |
      
  Scenario: Painting edit background color
    Given I should see "BackgroundColor"
    When I touch "BackgroundColor"
    Then I wait to see ColorPicker
    When I pick red in the ColorPicker
    And I confirm the pick
    Then I should pick color from ColorPicker in BackgroundColor
    
  Scenario: Painting clear selected layer content
    Given this is pending 
    
  Scenario Outline: Painting hide a layer
    Given I should see layer number <num>
    And I should see layer number <num> content
    When I touch Visible button for layer number <num>
    Then I should not see layer number <num> content
    Examples:
    | num |
    | 1   |
    
  Scenario Outline: Painting unhide a layer
    Given I should see layer number <num>
    And I should not see layer number <num> content
    When I touch Visible button for layer number <num>
    Then I should see layer number <num> content
    Examples:
    | num |
    | 1   |    
    
  Scenario Outline: Painting set blend mode for a layer
    Given I should see layer number <num>
    When I touch Blend button for layer number <num>
    #Then I wait to see "BlendModeList"
    Given I should see  "<blendMode>"
    When I touch "<blendMode>"
    And I confirm the pick
    #Then I wait to not see "BlendModeList"
    And I should set blend mode for layer number <num>
    Examples:
    | num | blendMode  |
    | 2   | Normal     |
    | 2   | Multiply   |
    | 2   | Screen     |
    | 2   | Overlay    |
    | 2   | Darken     |
    | 2   | Lighten    |
    | 2   | ColorDodge |
    | 2   | ColorBurn  |
    | 2   | SoftLight  |
    | 2   | HardLight  |
    | 2   | Difference |
    | 2   | Exclusion  |
    | 2   | Hue        |
    | 2   | Saturation |
    | 2   | Color      |
    | 2   | Luminosity |
