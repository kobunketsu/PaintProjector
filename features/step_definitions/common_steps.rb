When /^I touch hidden "([^\"]*)"$/ do |name|
  touch("all view marked:'#{name}'")
  sleep(STEP_PAUSE)  
end