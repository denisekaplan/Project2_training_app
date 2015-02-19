require 'test_helper'

class AddPasswordDigestToUsersControllerTest < ActionController::TestCase
  test "should get password:password_digest" do
    get :password:password_digest
    assert_response :success
  end

end
