def float_equal(a, b)
  if a + 0.00001 > b and a - 0.00001 < b
    true
  else
    false
  end
end

Then /^I transition from "([^\"]*)" to "([^\"]*)"$/ do |fromView, toView|
  wait_for_elements_do_not_exist( [ "view marked:'#{fromView}'" ], :timeout => WAIT_TIMEOUT)  
  wait_for_elements_exist( [ "view marked:'#{toView}'" ], :timeout => WAIT_TIMEOUT)    
end

When /^I touch hidden "([^\"]*)"$/ do |name|
  touch("all view marked:'#{name}'")
  sleep(STEP_PAUSE)  
end

Then /^I (?:press|touch) up screen (\d+) from the left and (\d+) from the top$/ do |x, y|
  touch(nil, {:offset => {:x => x.to_i, :y => y.to_i}})
  #no sleep
end

Then /^I long (?:press|touch) on screen (\d+) from the left and (\d+) from the top$/ do |x, y|
  pending
  #playback("long_press")
end

