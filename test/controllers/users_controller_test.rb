require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:users)
  # end

  test "should get new" do
    get :new
    assert_response :success
  end
  #
  # test "should create user" do
  #   assert_difference('User.count') do
  #     post :create, user: { first_name: @user.first_name, email: @user.email }
  #   end
  #
  #   assert_redirected_to root_path(assigns(:user))
  # end
  #
  # test "should show user" do
  #   get :show, id: @user
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit, id: @user
  #   assert_response :success
  # end
  #
  # test "should update user" do
  #   patch :update, id: @user, note: { body: @user.body, name: @user.name, user_id: @user.user_id }
  #   assert_redirected_to user_path(assigns(:user))
  # end
  #
  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete :destroy, id: @user
  #   end
  #
  #   assert_redirected_to user_path
  # end
end
