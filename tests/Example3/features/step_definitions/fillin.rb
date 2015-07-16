Given(/^I create a user and I login$/) do
  $data = {}
  $data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' # Create a random user name
  $data['user_password'] = 'password'

  rest_post_call('http://localhost:4567/add_user', $data)
  visit('http://localhost:4567')
  fill_in('username', :with => $data['user_name'])
  fill_in('password', :with => $data['user_password'])
  click_button('Sign in')
  find(:xpath, './/div[2]/ul/li[2]/a').click
end
# logged in now select the Details form

When(/^I fill in all the fields and submit$/) do
    #find('first-name')
  fill_in('first-name', :with => 'Lee')
  #find('second-name')
  fill_in('second-name', :with => 'Morcom')
  #find('house-number)
  fill_in('house-number', :with => '23')
  #find('street'
  fill_in('street', :with => 'Cramber Close')
  #find('city')
  fill_in('city', :with => 'Plymouth')
  #find('postcode')
  fill_in('postcode', :with => 'PL6 7AZ')
    #check I like walking checkbox
  check('walking')
    #check I like cycling checkbox
   check('cycling')
    #check I like swimming checkbox
  check('swimming')
    #select submit    
  click_button('Submit')
   #find(:xpath, './/div[2]/ul/li[2]/a').click
  #html/body/div[1]/form/button 
    
end


Then(/^I get confirmation of those details$/) do
# pending Write code here that turns the phrase above into concrete actions

#expect(page).to have_content('My awesome details are shown below') 
assert_match('My awesome details are shown below', page.body, 'Incorrect this is a failure')
page.has_content?('Lee Morcom')

expect(page).to have_content('I Live at the following address')
expect(page).to have_content('23 Cramber Close Plymouth PL6 7AZ') 
expect(page).to have_content('I am male')

expect(page).to have_content('My hobbies are listed below')

expect(page).to have_content('walking')
expect(page).to have_content('cycling')
expect(page).to have_content('swimming')
expect(page).to have_content('I drive a volvo')

end