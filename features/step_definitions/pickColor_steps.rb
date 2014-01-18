Then /^I wait to see Pallete$/ do
  wait_for_elements_exist([ "view marked:'Pallete'"], :timeout => WAIT_TIMEOUT)
  element_exists("view marked:'Pallete UsingColor'")
  element_exists("view marked:'Pallete PickedColor'")
  element_exists("view marked:'Pallete HSV SV'")
  element_exists("view marked:'Pallete SV Picker'")
  element_exists("view marked:'Pallete HSV Hue'")
  element_exists("view marked:'Pallete Hue Picker'")
  element_exists("view marked:'Pallete Type'")            
  
end

When /^I pick red in the pallete$/ do
  touch("view marked:'Pallete HSV Hue'", :offset => {:x => -128, :y => 0})
  sleep(STEP_PAUSE)
  touch("view marked:'Pallete HSV SV'", :offset => {:x => 128, :y => -128})
  sleep(STEP_PAUSE)
end

And /^I confirm the pick$/ do
  touch(nil, {:offset => {:x => 0, :y => 0}})
  sleep(STEP_PAUSE)
  wait_for_elements_do_not_exist( [ "view marked:'Pallete'" ], :timeout => WAIT_TIMEOUT)
end

Then /^I am using the picked color$/ do
  element_exists("view marked:'UsingColor'")
  query("view marked'UsingColor'")
end
