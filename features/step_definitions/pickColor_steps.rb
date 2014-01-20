Then /^I wait to see ColorPicker$/ do
  wait_for_elements_exist(["view marked:'ColorPicker'"], :timeout => WAIT_TIMEOUT)
  wait_for_elements_exist(["view marked:'ColorPicker UsingColor'"], :timeout => WAIT_TIMEOUT)
  wait_for_elements_exist(["view marked:'ColorPicker PickedColor'"], :timeout => WAIT_TIMEOUT)
  wait_for_elements_exist(["view marked:'ColorPicker SV View'"], :timeout => WAIT_TIMEOUT)
  wait_for_elements_exist(["view marked:'ColorPicker SV Picker'"], :timeout => WAIT_TIMEOUT)
  wait_for_elements_exist(["view marked:'ColorPicker Hue View'"], :timeout => WAIT_TIMEOUT)
  wait_for_elements_exist(["view marked:'ColorPicker Hue Picker'"], :timeout => WAIT_TIMEOUT)
  wait_for_elements_exist(["view marked:'ColorPicker PickMode'"], :timeout => WAIT_TIMEOUT)
  
end

When /^I pick red in the ColorPicker$/ do
  touch("view marked:'ColorPicker Hue View'", :offset => {:x => -128, :y => 0})
  sleep(STEP_PAUSE)
  
  touch("view marked:'ColorPicker SV View'", :offset => {:x => 128, :y => -128})
  sleep(STEP_PAUSE)
  
  @pickedColor = query("view marked:'ColorPicker PickedColor'", "backgroundColor")[0]
end

Then /^I confirm the pick$/ do
  touch(nil, {:offset => {:x => 0, :y => 0}})
  sleep(STEP_PAUSE)
  wait_for_elements_do_not_exist( [ "view marked:'ColorPicker'" ], :timeout => WAIT_TIMEOUT)
end

Then /^I am using color from ColorPicker$/ do
  #element_exists("view marked:'UsingColor'")
  strColor = query("view marked:'UsingColor'", "color")[0]

  if not strColor == @pickedColor
    raise "I am not using red color. Using color #{strColor}"
  end
end

When /^I touch color slot number (\d+) on pallete$/ do |index|
  res = element_exists("scrollView marked:'Pallete'")
  if not res
    screenshot_and_raise "No element found with mark Pallete'"
  end
  
  strIndex = (index-1).to_s
  label = 'PalleteColor_'+strIndex
  res = element_exists( "view:'ColorButton' marked:'#{label}'" )
  
  if not res
    scroll("scrollView index:0", :right)
    sleep(STEP_PAUSE)
    wait_for_elements_exist([ "view:'ColorButton' marked:'#{label}'" ], :timeout => WAIT_TIMEOUT)
  end 
  
  touch("view:'ColorButton' marked:'#{label}'")
  sleep(STEP_PAUSE)
end

Then /^I am using number (\d+) color from pallete$/ do |index|
  res = element_exists("scrollView marked:'Pallete'")
  if not res
    screenshot_and_raise "No element found with mark Pallete'"
  end
  
  strIndex = (index-1).to_s
  label = 'PalleteColor_'+strIndex
    
  strColor = query("view:'ColorButton' marked:'#{label}'", "color")[0]
  strUsingColor = query("view:'PaintColorButton'", "color")[0]
  res = strColor == strUsingColor
  if not res
    raise "I am not using color from pallete. Using '#{strUsingColor}'"
  end  
end

Then /^I am using color from Magnifier$/ do
  res = element_exists("all view marked:'Magnifier'")
  if not res
    raise "I can't see magnifier"
  end
  
  strColor = query("all view marked:'Magnifier'", "color")[0]
  strUsingColor = query("view:'PaintColorButton'", "color")[0]
  res = strColor == strUsingColor
  if not res
    raise "I am not using color from Magnifier. Using '#{strUsingColor}'"
  end    
end

