require 'test_helper'

class WeisControllerTest < ActionController::TestCase
  setup do
    @wei = weis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wei" do
    assert_difference('Wei.count') do
      post :create, wei: { User: @wei.User, address: @wei.address, description: @wei.description, latitude: @wei.latitude, longitude: @wei.longitude, title: @wei.title }
    end

    assert_redirected_to wei_path(assigns(:wei))
  end

  test "should show wei" do
    get :show, id: @wei
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wei
    assert_response :success
  end

  test "should update wei" do
    patch :update, id: @wei, wei: { User: @wei.User, address: @wei.address, description: @wei.description, latitude: @wei.latitude, longitude: @wei.longitude, title: @wei.title }
    assert_redirected_to wei_path(assigns(:wei))
  end

  test "should destroy wei" do
    assert_difference('Wei.count', -1) do
      delete :destroy, id: @wei
    end

    assert_redirected_to weis_path
  end
end
