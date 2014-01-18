#Paint screen steps
Given /^I am on the Paint Screen$/ do
	#draw tools
	element_exists("view marked:'Drawing pad'")
	element_exists("view marked:'Canvas'")
	element_exists("button marked:'UsingBrush'")
	element_exists("button marked:'BackupBrush'")	
	element_exists("button marked:'UsingColor'")
	element_exists("slider marked:'RadiusSlider'")
	element_exists("slider marked:'OpacitySlider'")	
	element_exists("button marked:'Eyedropper'")
	element_exists("tableView marked:'Pallete'")
	
	#other tools
	element_exists("view marked:'MainToolBar'")
	element_exists("view marked:'PaintToolBar'")
	element_exists("button marked:'Layer'")
	element_exists("button marked:'Transform'")
	element_exists("button marked:'Undo'")
	element_exists("button marked:'Redo'")
	element_exists("button marked:'Import'")
	element_exists("button marked:'Export'")
	element_exists("button marked:'Close'")
end

Given /^I start to edit a new file in the Paint Screen$/ do
  steps %{
    Given I see ArtworkTools
    Then I should see a "New" button
    Then I touch the "New" button
    Then I wait to see "PaintScreen"
    Then I am on the Paint Screen
  }
end

When /^I try to find "([^\"]*)"$/ do |brush|
  res = element_exists( "view marked:'#{brush}'" )

  if not res
    scroll("scrollView index:0", :right)
    sleep(STEP_PAUSE)
    wait_for_elements_exist([ "view marked:'#{brush}'" ], :timeout => WAIT_TIMEOUT)
  end
end

Then /^I see property "([^\"]*)" on slider "([^\"]*)"$/ do |property, name|
  property = query("view:'BrushTypeButton'", "brush", "brushState", "#{property}")[0]
  uiValue = query("slider marked:'#{name}'", "value")[0]
  if (property < uiValue) or (property > uiValue)
    raise "brush property #{property} error on slider #{name}"
  end
end


Then /^I am using the "([^\"]*)"$/ do |brushName|
  res = query("button marked:'UsingBrush'", "brush", "name")[0]
  res == '#{brushName}'

  property = query("view:'BrushTypeButton'", "brush", "brushState", "radius")[0]
  uiValue = query("slider marked:'RadiusSlider'", "value")[0]
  if (property < uiValue) or (property > uiValue)
    raise "brush property radius error on slider RadiusSlider"
  end
  
  property = query("view:'BrushTypeButton'", "brush", "brushState", "opacity")[0]
  uiValue = query("slider marked:'OpacitySlider'", "value")[0]
  if (property < uiValue) or (property > uiValue)
    raise "brush property opacity error on slider OpacitySlider"
  end  
end

Then /^I am backuping the "([^\"]*)"$/ do |brushName|
  res = query("all view marked:'BackupBrush'", "brush", "name")[0]
  res == '#{brushName}'
end
