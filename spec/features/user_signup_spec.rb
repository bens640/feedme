require 'rails_helper.rb'

feature 'Creating Rservation' do
  scenario 'new user can make reservation' do
    # visit the root route
    visit '/'
    # click on a button to create a new post
    click_link 'Make Reservation'
    # fill out the bits of the form that we need.
    click_link 'Sign up'
    have_input_field(first_name, last_name, email, password, password confirmation)
    # fill_in 'first_name', with: 'User_first_name'
    # fill_in 'Last name', with: 'User_last_name'
    # fill_in 'Email', with: 'User_email'
    # fill_in 'Password', with: 'password'
    # fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'

    # expect the page that we're sent to have a specific text
    # expect(page).to have_content('#coffeetime')
    # # expect the page to contain our photo.
    # expect(page).to have_css("img[src*='coffee.jpg']")
  end
end
