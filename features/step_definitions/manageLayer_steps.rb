Given /^I touch layer number (\d+)$/ do |index|
  index = index.to_i
  screenshot_and_raise "Index should be positive (was: #{index})" if (index<=0)
  
  @touchedLayerIndex = index - 1
  @touchedLayerId = query("all view:'LayerTableViewCell' index:#{index - 1}", :accessibilityIdentifier)[0]
  
  touch("tableViewCell index:#{index-1}")
  sleep(STEP_PAUSE)
end

Then /^I should create a new layer above$/ do
  newLayerIndex = @touchedLayerIndex + 1
  layerId = query("all view:'LayerTableViewCell' index:#{newLayerIndex}", :accessibilityIdentifier)[0]
  
  if not layerId == @touchedLayerId
    raise "create new layer error!  touchedLayerId '#{@touchedLayerId}' errorlayerId '#{layerId}'"
  end

end

Given /^I should see layer number (\d+)$/ do |index|
  index = index.to_i
  
  res = element_exists("all view:'LayerTableViewCell' index:#{index - 1}")
  if not res
    count = query("all view:'LayerTableViewCell'").count
    
    touch("tableViewCell index:#{count-1}")
    sleep(STEP_PAUSE)
    
    toCreateCnt = index - count
    for i in 1..toCreateCnt
      touch("button marked:'AddLayer'")
      sleep(STEP_PAUSE)
    end
  end
    
end

When /^I touch Delete for layer number (\d+)$/ do |index|
  index = index.to_i
  
  @deleteLayerId = query("all view:'LayerTableViewCell' index:#{index - 1}", :accessibilityIdentifier)[0]
  
  touch("view:'UITableViewCellEditControl' index:#{index-1}")
  sleep(STEP_PAUSE)
  
  touch("view:'UITableViewCellDeleteConfirmationView' index:0")
  sleep(STEP_PAUSE)
  
end

Then /^I should delete layer number (\d+)$/ do |index|
  index = index.to_i
  
  layerId = query("view:'LayerTableViewCell' marked:'#{@deleteLayerId}'")[0]
  if layerId
    raise "delete layer number #{index} failed! deleteLayerId '#{@deleteLayerId}' layerId '#{layerId}'"
  end
end