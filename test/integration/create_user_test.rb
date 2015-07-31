require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
  #1 go to index page
  get '/'
  assert_response :success

  #2 click on new user
  get '/users/new'
  assert_response :success

  # #3 fill out form and click "create user"
  # assert_difference('User.count') do
  #   post_via_redirect '/users', user: {email: 'integration@wyncode.co', name: 'integration Test'}
  # end
  # #4 confirm that you see the make reservation page with flash message
  # # "User was create and logged in"
  # assert_match /\/users\/\d+/,path
  # assert_equal 'User was successfully created.',flash[:notice]
  #
  # #5 click back ang go back to users's index page
  # get '/users'
  #
  # #6. confirm that your new user appears in the index page
  # assert_select 'td', 'integration@wyncode.co',1
  # assert_select 'td', 'integration Test',1
end