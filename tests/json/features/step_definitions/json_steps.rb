Given(/^I have entered a title number$/) do
  $structure =getstubjson ('DT160760')
end

When(/^the object is returned$/) do
  $structure_hash=JSON.parse($structure)
end

Then(/^I can confirm the data$/) do
  #puts $structure_hash['application_reference']
  #puts $structure_hash['migration_errors'][3]
  #puts $structure_hash['dlr']
  #expect($structure_hash['dlr']).to eq('Weymouth Office')
  puts $structure_hash['uprns'][0]
  expect($structure_hash['uprns'][0]).to eq('26241363')
end
