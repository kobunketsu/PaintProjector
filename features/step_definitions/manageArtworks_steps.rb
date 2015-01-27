#Home screen steps
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
    wait_for_elements_exist([ "button marked:'Printer'" ], :timeout => WAIT_TIMEOUT)
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
    
    wait_for_elements_exist([ "view marked:'DeleteArtworkAlert'" ], :timeout => WAIT_TIMEOUT)
    wait_for_elements_exist([ "button marked:'#{DeleteArtwork}'"], :timeout => WAIT_TIMEOUT)
    wait_for_elements_exist([ "button marked:'#{CancelArtwork}'"], :timeout => WAIT_TIMEOUT)
    wait_for_elements_exist([ "label marked:'#{Are you sure you want to delete?}'"], :timeout => WAIT_TIMEOUT)
    
    touch("button marked:(DeleteArtwork)")

    wait_for_elements_do_not_exist( [ "view marked:'DeleteArtworkAlert'" ], :timeout => WAIT_TIMEOUT)
    wait_for_elements_do_not_exist( [ "view marked:#{result}" ], :timeout => WAIT_TIMEOUT)

end

Then /^I copy paint number (\d+)$/ do |index|
    index = index.to_i
    screenshot_and_raise "Index should be positive (was: #{index})" if (index<=0)
	
    wait_for_elements_exist([ "tableViewCell index:#{index-1}" ], :timeout => WAIT_TIMEOUT)
    touch("tableViewCell index:#{index-1}")
    oldCount = query("all tableViewCell").count

  
    wait_for_elements_exist([ "button marked:'Copy'" ], :timeout => WAIT_TIMEOUT)
    touch("button marked:'Copy'")
    sleep 1## wait for previous screen to disappear
    
    newCount = query("all tableViewCell").count
    
    if newCount != oldCount + 1
       screenshot_and_raise "copy paint error newCount #{newCount} oldCount #{oldCount}"
    else
       #raise "copy paint done newCount #{newCount} oldCount #{oldCount}"
    end    
end

Then /^I copy paint number (\d+) repeat (\d+) times$/ do |index, count|
end
