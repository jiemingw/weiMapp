require 'test_helper'

class AttractiviveFinderControllerTest < ActionController::TestCase
  test "should get get_new_attractions" do
    get :get_new_attractions
    assert_response :success
  end

end
