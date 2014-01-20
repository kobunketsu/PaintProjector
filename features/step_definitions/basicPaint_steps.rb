#Paint screen steps
Then /^I am on the Paint Screen$/ do
	#draw tools
	wait_for_elements_exist(["view marked:'DrawingPad'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["view marked:'Canvas'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'UsingBrush'"], :timeout => WAIT_TIMEOUT)
  #BackupBrush not visible?
	wait_for_elements_exist(["all view marked:'BackupBrush'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'UsingColor'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["slider marked:'RadiusSlider'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["slider marked:'OpacitySlider'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'EyeDropper'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["scrollView marked:'Pallete'"], :timeout => WAIT_TIMEOUT)
	
	#other tools
	wait_for_elements_exist(["view marked:'MainToolBar'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["view marked:'PaintToolBar'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Layer'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Transform'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Undo'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Redo'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Import'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Export'"], :timeout => WAIT_TIMEOUT)
	wait_for_elements_exist(["button marked:'Close'"], :timeout => WAIT_TIMEOUT)
end

Given /^I start to edit a new file in the Paint Screen$/ do
  steps %{
    Given I see ArtworkTools
    Then I should see a "New" button
    Then I touch the "New" button
    Then I wait to see "PaintScreen"
    Then I am on the Paint Screen
  }
end

Then /^I enter FullScreen$/ do
   check_element_exists("view marked:'PaintScreen'")
   check_element_exists("view marked:'DrawingPad'")
   check_element_exists("view marked:'Canvas'")
   check_element_exists("button marked:'NormalScreen'")   
   if not query("view").count > 4
     raise "exist redundent views in full screen"
   end
end