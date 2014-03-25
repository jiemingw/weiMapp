require 'test_helper'

class ActivityControllerTest < ActionController::TestCase
  test "should get lookup" do
    get :lookup
    assert_response :success
  end

end
