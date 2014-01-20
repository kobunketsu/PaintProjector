def cellIndexForLayer(layerIndex)
  count = query("all view:'LayerTableViewCell'").count
  return count - layerIndex  
end

Given /^I should see layer number (\d+)$/ do |index|
  count = query("all view:'LayerTableViewCell'").count
  cellIndex = count - index
  
  res = element_exists("all view:'LayerTableViewCell' index:#{cellIndex}")
  if not res  #create new layers to reach count index
    touch("tableViewCell index:#{count-1}")
    sleep(STEP_PAUSE)
    
    toCreateCnt = index - count
    for i in 1..toCreateCnt
      touch("button marked:'NewLayer'")
      sleep(STEP_PAUSE)
    end
  end
    
end


Given /^I touch layer number (\d+)$/ do |index|
  screenshot_and_raise "Index should be positive (was: #{index})" if (index<=0)
  
  @touchedCellIndex = cellIndexForLayer(index)
  @touchedLayerId = query("all view:'LayerTableViewCell' index:#{@touchedCellIndex}", :accessibilityIdentifier)[0]
  
  touch("tableViewCell index:#{@touchedCellIndex}")
  sleep(STEP_PAUSE)
end


#new
When /^I touch New button for layer number (\d+)$/ do |index|
  @beforeNewCount = query("all view:'LayerTableViewCell'").count
  @newLayerCellIndex = cellIndexForLayer(index)
  @newLayerId = query("all view:'LayerTableViewCell' index:#{@copyLayerCellIndex}", :accessibilityIdentifier)[0]

  wait_for_elements_exist(["view marked:'NewLayer'"], :timeout => WAIT_TIMEOUT)
  touch("button marked:'NewLayer'")
  sleep(STEP_PAUSE)
end

Then /^I should create a new layer above$/ do
  
  #count increased by 1
  count = query("all view:'LayerTableViewCell'").count
  if not count == @beforeNewCount + 1
    raise "copy layer number #{index} failed. count not increased by 1"
  end  
  
  #source layer cell index increased by 1
  newLayerCellIndex = @newLayerCellIndex + 1
  if not @newLayerId == query("all view:'LayerTableViewCell' index:#{newLayerCellIndex}", :accessibilityIdentifier)[0]
    raise "create new layer error!  source layer cell index not increased by 1"
  end
end

#delete
When /^I touch Delete button for layer number (\d+)$/ do |index|
  cellIndex = cellIndexForLayer(index)
    
  @deleteLayerId = query("all view:'LayerTableViewCell' index:#{cellIndex}", :accessibilityIdentifier)[0]
  
  touch("view:'UITableViewCellEditControl' index:#{cellIndex}")
  sleep(STEP_PAUSE)
  
  touch("view:'UITableViewCellDeleteConfirmationView' index:0")
  sleep(STEP_PAUSE)
  
end

Then /^I should delete layer number (\d+)$/ do |index|
  #cell marked deleteLayerId should not be found
  layerId = query("view:'LayerTableViewCell' marked:'#{@deleteLayerId}'")[0]
  if layerId
    raise "delete layer number #{index} failed! cell marked '#{deleteLayerId}' should not be found"
  end
end

#copy
When /^I touch Copy button for layer number (\d+)$/ do |index|
  @beforeCopyCount = query("all view:'LayerTableViewCell'").count
  @copyLayerCellIndex = cellIndexForLayer(index)
  @copyLayerId = query("all view:'LayerTableViewCell' index:#{@copyLayerCellIndex}", :accessibilityIdentifier)[0]
  
  wait_for_elements_exist(["view marked:'CopyLayer'"], :timeout => WAIT_TIMEOUT)
  touch("button marked:'CopyLayer'")
  sleep(STEP_PAUSE)

end

Then /^I should copy layer number (\d+) above$/ do |index|
  #count increased by 1
  count = query("all view:'LayerTableViewCell'").count
  if not count == @beforeCopyCount + 1
    raise "copy layer number #{index} failed. count not increased by 1"
  end
  
  #source layer cell index increased by 1
  copyLayerCellIndex = @copyLayerCellIndex + 1
  if not @copyLayerId == query("all view:'LayerTableViewCell' index:#{copyLayerCellIndex}", :accessibilityIdentifier)[0]
    raise "copy layer number #{index} failed. source layer cell index not increased by 1"
  end
end

#move
When /^I drag ReorderControl of layer number (\d+) above layer number (\d+)$/ do |from, to|
  
  #no play/record support on ios7
  pending
  control = query("all view:'LayerTableViewCell' index:#{from} descendant tableViewCellReorderControl")[0]
  if from < i
    #interpolate "pan", {:start => "view marked:'A'", :end => "view marked:'B'"}
  else
  end
end

Then /^I should move layer number (\d+) above layer number (\d+)$/ do |from, to|
  pending
end

#merge
When /^I touch Merge button for layer number (\d+)$/ do |index|
  cellIndex = cellIndexForLayer(index)
  @mergeLayerId = query("all view:'LayerTableViewCell' index:#{cellIndex}", :accessibilityIdentifier)[0]
  
  touch("button marked:'MergeLayer'")
  sleep(STEP_PAUSE)
end

Then /^I should merge layer number (\d+) down$/ do |index|
  #cell marked mergeLayerId should not be found
  layerId = query("view:'LayerTableViewCell' marked:'#{@mergeLayerId}'")[0]
  if layerId
    raise "delete layer number #{index} failed! cell marked '#{deleteLayerId}' should not be found"
  end
end

#background color
Then /^I should pick color from ColorPicker in BackgroundColor$/ do
  strColor = query("view marked:'BackgroundColor'", "backgroundColor")[0]
  if not @pickedColor == strColor
    raise "I haven't set background color to red. Using color '#{strColor}' picked color '#{@pickedColor}'"
  end  
end

#visibility
And /^I should see layer number (\d+) content$/ do |index|
  
  cellIndex = cellIndexForLayer(index)
  
  res = query("view:'LayerTableViewCell' index:#{cellIndex}", "visibleButton", "isVisible")[0]
  if res.to_i == 0
    raise "layer number #{index} content should be visible"
  end
end

Then /^I should not see layer number (\d+) content$/ do |index|

  cellIndex = cellIndexForLayer(index)
  
  res = query("view:'LayerTableViewCell' index:#{cellIndex}", "visibleButton", "isVisible")[0]
  if res.to_i != 0
    raise "layer number #{index} content should be hiden"
  end

end

When /^I touch Visible button for layer number (\d+)$/ do |index|
  
  cellIndex = cellIndexForLayer(index)
    
  touch("view:'LayerVisibleButton' index:#{cellIndex}")
  sleep(STEP_PAUSE)
end

#blend mode
When /^I touch Blend button for layer number (\d+)$/ do |index|
  
  cellIndex = cellIndexForLayer(index)
    
  touch("view:'LayerBlendModeButton' index:#{cellIndex}")
  sleep(STEP_PAUSE)  
end
    
Then /^I should set blend mode for layer number (\d+)$/ do |index|
  pending
end