require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "show requires authentication" do
    get account_path
    assert_redirected_to new_session_path
  end

  test "show when authenticated" do
    sign_in_as users(:one)
    get account_path
    assert_response :success
  end
end
