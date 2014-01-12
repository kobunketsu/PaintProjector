Given /^I am on the Welcome Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

Then /^I (?:press|touch) "([^\"]*)"$/ do |name|
    touch("view marked:'#{name}'")
    sleep(STEP_PAUSE)
end