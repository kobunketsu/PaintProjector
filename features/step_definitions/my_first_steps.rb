Given /^I am on the Welcome Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

Given /^I see ArtworkTools$/ do
    touch("view marked:'My Artwork'")
    sleep(STEP_PAUSE)
end

Given /^I see at least one artworks$/ do
    result = query("tableViewCell index:0")
    check_element_exists(result)
    sleep(STEP_PAUSE)
end

