Then /^I wait to see ColorPicker$/ do
  wait_for_elements_exist([ "view marked:'ColorPicker'"], :timeout => WAIT_TIMEOUT)
  element_exists("view marked:'ColorPicker UsingColor'")
  element_exists("view marked:'ColorPicker PickedColor'")
  element_exists("view marked:'ColorPicker SV View'")
  element_exists("view marked:'ColorPicker SV Picker'")
  element_exists("view marked:'ColorPicker Hue View'")
  element_exists("view marked:'ColorPicker Hue Picker'")
  element_exists("view marked:'ColorPicker ChildMode'")            
  
end

When /^I pick red in the ColorPicker$/ do
  touch("view marked:'ColorPicker Hue View'", :offset => {:x => -128, :y => 0})
  sleep(STEP_PAUSE)
  touch("view marked:'ColorPicker SV View'", :offset => {:x => 128, :y => -128})
  sleep(STEP_PAUSE)
  
end

Then /^I confirm the pick$/ do
  touch(nil, {:offset => {:x => 0, :y => 0}})
  sleep(STEP_PAUSE)
  wait_for_elements_do_not_exist( [ "view marked:'ColorPicker'" ], :timeout => WAIT_TIMEOUT)
end

Then /^I am using red color$/ do
  element_exists("view marked:'UsingColor'")
  strColor = query("view marked:'UsingColor'", "color")[0].split(" ")
  r = strColor[1].to_f
  g = strColor[2].to_f
  b = strColor[3].to_f
  a = strColor[4].to_f
  
  res = float_equal(r,1) and float_equal(g,1) and float_equal(b,1)
  if not res
    raise "I am not using red color. Using r #{r} g #{g} b#{b}"
  end
end

When /^I touch color slot number (\d+) on pallete$/ do |index|
  res = element_exists("scrollView marked:'Pallete'")
  if not res
    screenshot_and_raise "No element found with mark Pallete'"
  end
  
  index = index.to_i
  strIndex = (index-1).to_s
  label = 'PalleteColor'+strIndex
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
  
  index = index.to_i
  strIndex = (index-1).to_s
  label = 'PalleteColor'+strIndex
    
  strColor = query("view:'ColorButton' marked:'#{label}'", "color")[0]
  
  strUsingColor = query("view:'PaintColorButton'", "color")[0]
 
  res = strColor == strUsingColor
  if not res
    raise "I am not using color from pallete. Using #{res}"
  end  
 
end