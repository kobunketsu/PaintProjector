#Paint screen steps
Then /^I am on the Paint Screen$/ do
	#draw tools
	wait_for_elements_exist(["view marked:'DrawingPad'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["view marked:'Canvas'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'UsingBrush'"], :timeout => WAIT_TIMEOUT)
  #BackupBrush not visible?
	wait_for_elements_exist(["all view marked:'BackupBrush'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'UsingColor'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["slider marked:'RadiusSlider'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["slider marked:'OpacitySlider'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'EyeDropper'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["scrollView marked:'Pallete'"], :timeout => WAIT_TIMEOUT)
	
	#other tools
	wait_for_elements_exist(["view marked:'MainToolBar'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["view marked:'PaintToolBar'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Layer'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Transform'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Undo'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Redo'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Import'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Export'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Close'"], :timeout => WAIT_TIMEOUT)
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
  #BackupBrush not visible?
  res = query("all view marked:'BackupBrush'", "brush", "name")[0]
  res == '#{brushName}'
end
