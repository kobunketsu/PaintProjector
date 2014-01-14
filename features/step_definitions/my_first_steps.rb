Given /^I am on the Welcome Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

Given /^I see ArtworkTools$/ do
    check_element_exists("button marked:'My Artwork'")
    touch("button marked:'My Artwork'")
    wait_for_elements_exist([ "button marked:'Back'" ], :timeout => WAIT_TIMEOUT)
    wait_for_elements_exist([ "button marked:'New'" ], :timeout => WAIT_TIMEOUT)
    wait_for_elements_exist([ "button marked:'Copy'" ], :timeout => WAIT_TIMEOUT)
    wait_for_elements_exist([ "button marked:'Delete'" ], :timeout => WAIT_TIMEOUT)
    wait_for_elements_exist([ "button marked:'Print'" ], :timeout => WAIT_TIMEOUT)
    sleep(STEP_PAUSE)
end

Given /^I see at least one artworks$/ do
    query("view:'PaintFrameView'").count >= 1
    sleep(STEP_PAUSE)
end

Then /^I delete paint number (\d+)$/ do |index|
    index = index.to_i
    screenshot_and_raise "Index should be positive (was: #{index})" if (index<=0)
    
    wait_for_elements_exist([ "tableViewCell index:#{index-1}" ], :timeout => WAIT_TIMEOUT)
    touch("tableViewCell index:#{index-1}")
    result = query "view:'PaintFrameView' index:#{index-1}", :accessibilityLabel
    
    wait_for_elements_exist([ "button marked:'Delete'" ], :timeout => WAIT_TIMEOUT)
    touch("button marked:'Delete'")
    sleep 1## wait for previous screen to disappear
    wait_for_elements_do_not_exist( [ "PaintFrameView marked:#{result}" ], :timeout => WAIT_TIMEOUT)
    sleep(STEP_PAUSE)
end

