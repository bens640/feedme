require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
  end

  test "should create user"
    asser_difference('User.count') do
      post :create , user: {first_name:@user.email,
                            last_name:@user.last_name,
                            email:@user.}
    end
  end
end
test "should create user" do
  assert_difference('User.count') do
    post :create, user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, nickname: @user.nickname }
  end

  assert_redirected_to user_path(assigns(:user))
end