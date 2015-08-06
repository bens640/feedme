require 'rails_helper'

feature 'Chef authentication' do
  background do
    @chef = create(:chef)
  end
  scenario 'can log in from the index' do
    visit '/'
    click_link 'Chef Login'
    expect(page).to_not have_content('Create Chef')
    fill_in 'Email', with: @chef.email
    fill_in 'Password', with: '123'
    click_button 'Log in'
    expect(page).to have_content("#{@chef.first_name} you are logged in as a chef")
    end
end


feature 'User authentication' do
  background do
    @user = create(:user)
  end
  scenario 'can log in from the index' do
    visit '/'
    click_link 'User Login'
    expect(page).to_not have_content('Create User')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '2'
    click_button 'Log in'
    expect(page).to have_content("you are logged in")
    end
end
