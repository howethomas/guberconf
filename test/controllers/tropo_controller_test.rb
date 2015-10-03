require 'test_helper'

class TropoControllerTest < ActionController::TestCase
  test "should get inbound" do
    get :inbound
    assert_response :success
  end

end
