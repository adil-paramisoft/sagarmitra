require 'test_helper'

class MvaayooMessagesControllerTest < ActionController::TestCase
  test "should get receive" do
    get :receive
    assert_response :success
  end

end
