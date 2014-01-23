Given /^I touch layer number (\d+)$/ do |index|
  index = index.to_i
  screenshot_and_raise "Index should be positive (was: #{index})" if (index<=0)
  count = query("all view:'LayerTableViewCell'").count
  
  @touchedLayerIndex = count - index
  @touchedLayerId = query("all view:'LayerTableViewCell' index:#{@touchedLayerIndex}", :accessibilityIdentifier)[0]
  
  touch("tableViewCell index:#{index-1}")
  sleep(STEP_PAUSE)
end

#has error
Then /^I should create a new layer above$/ do
  newLayerIndex = @touchedLayerIndex + 1
  layerId = query("all view:'LayerTableViewCell' index:#{newLayerIndex}", :accessibilityIdentifier)[0]
  
  if not layerId == @touchedLayerId
    raise "create new layer error!  touchedLayerId '#{@touchedLayerId}' errorlayerId '#{layerId}'"
  end

end

Given /^I should see layer number (\d+)$/ do |index|
  index = index.to_i
  count = query("all view:'LayerTableViewCell'").count
  layerIndex = count - index
  
  res = element_exists("all view:'LayerTableViewCell' index:#{layerIndex}")
  if not res  #create new layers to reach count index
    touch("tableViewCell index:#{count-1}")
    sleep(STEP_PAUSE)
    
    toCreateCnt = index - count
    for i in 1..toCreateCnt
      touch("button marked:'AddLayer'")
      sleep(STEP_PAUSE)
    end
  end
    
end

#delete
When /^I touch Delete button for layer number (\d+)$/ do |index|
  index = index.to_i
  count = query("all view:'LayerTableViewCell'").count
  layerIndex = count - index
    
  @deleteLayerId = query("all view:'LayerTableViewCell' index:#{layerIndex}", :accessibilityIdentifier)[0]
  
  touch("view:'UITableViewCellEditControl' index:#{layerIndex}")
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

#copy
When /^I touch Copy button for layer number (\d+)$/ do |index|
  index = index.to_i
  count = query("all view:'LayerTableViewCell'").count
  layerIndex = count - index  
    
  @copyLayerId = query("all view:'LayerTableViewCell' index:#{layerIndex}", :accessibilityIdentifier)[0]
  @copyLayerIndex = layerIndex
  
  wait_for_elements_exist(["view marked:'CopyLayer'"], :timeout => WAIT_TIMEOUT)
  touch("view marked:'CopyLayer'")
  sleep(STEP_PAUSE)

end

Then /^I should copy layer number (\d+) above$/ do |index|

end