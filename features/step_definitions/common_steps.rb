When /^I touch hidden "([^\"]*)"$/ do |name|
  touch("all view marked:'#{name}'")
  sleep(STEP_PAUSE)  
end

def float_equal(a, b)
  if a + 0.00001 > b and a - 0.00001 < b
    true
  else
    false
  end
end