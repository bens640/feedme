require 'rails_helper'

feature 'User authentication' do
  background do
    @user = create(:user)
  end
  scenario 'can log in from the index' do
    visit '/'
    click_link 'User Login'
    expect(page).to_not have_content('Create User')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '123'
    click_button 'Log in'
    expect(page).to have_content("you are logged in as a admin")
    fill_in 'Details', with: "Ha look at me now."
    select '2011', from: 'reservation[date(1i)]'
    select 'January', from: 'reservation[date(2i)]'
    select '3', from: 'reservation[date(3i)]'
    select '10:00am', from: 'reservation_time'
    fill_in 'reservation[address]', with: '5555 sw 555 st'
    fill_in 'reservation[address2]', with: '5555 sw 555 st'
    fill_in 'City', with: 'Miami'
    fill_in 'State', with: 'Florida'
    fill_in 'Zip', with: '33176'
    fill_in 'Phone', with: '555-555-5555'
    click_button 'Create Reservation'
    expect(page).to have_content("Created reservation")
    end
end
