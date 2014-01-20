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
