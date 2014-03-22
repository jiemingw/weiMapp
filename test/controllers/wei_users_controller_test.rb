require 'test_helper'

class WeiUsersControllerTest < ActionController::TestCase
  setup do
    @wei_user = wei_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wei_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wei_user" do
    assert_difference('WeiUser.count') do
      post :create, wei_user: { address: @wei_user.address, description: @wei_user.description, latitude: @wei_user.latitude, longitude: @wei_user.longitude, title: @wei_user.title }
    end

    assert_redirected_to wei_user_path(assigns(:wei_user))
  end

  test "should show wei_user" do
    get :show, id: @wei_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wei_user
    assert_response :success
  end

  test "should update wei_user" do
    patch :update, id: @wei_user, wei_user: { address: @wei_user.address, description: @wei_user.description, latitude: @wei_user.latitude, longitude: @wei_user.longitude, title: @wei_user.title }
    assert_redirected_to wei_user_path(assigns(:wei_user))
  end

  test "should destroy wei_user" do
    assert_difference('WeiUser.count', -1) do
      delete :destroy, id: @wei_user
    end

    assert_redirected_to wei_users_path
  end
end
