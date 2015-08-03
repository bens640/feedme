require 'rails_helper.rb'

feature 'Creating User' do
  scenario 'User signs up' do
    # visit the User sign up
    visit '/'
    # puts page.body
    click_link 'New User'
    expect(page).to have_content('New User')
    # fill out the bits of the form that we need.
    fill_in 'Email', with: 'sean@cookio.com'
    fill_in 'First name', with: 'sean'
    fill_in 'Last name', with: 'sean'
    fill_in 'Password', with: 'secret1'
    fill_in 'Password confirmation', with: 'secret1'
    #created us click the submit button
    click_button 'Create User'
    # puts page.source
    # expect the page that we're sent to have a specific text
    expect(page).to have_content('created user and logged in')
   end
end


feature 'Creating Chef' do
  scenario 'Chef signs up' do
    # visit the Chef sign up
    visit '/'
    click_link 'New Chef'
    expect(page).to have_content('New Chef')
    # fill out the bits of the form that we need.
    fill_in 'Email', with: 'seandachef@cookio.com'
    fill_in 'First name', with: 'sean'
    fill_in 'Last name', with: 'sean'
    fill_in 'City', with: 'Miami'
    fill_in 'State', with: 'Florida'
    fill_in 'Zip', with: '33176'
    fill_in 'Phone', with: '555-555-5555'
    fill_in 'Password', with: 'secret1'
    fill_in 'Password confirmation', with: 'secret1'
    #created us click the submit button
    click_button 'Create Chef'
    # puts page.source
    # expect the page that we're sent to have a specific text
    expect(page).to have_content('Created chef and logged in')
   end
end
