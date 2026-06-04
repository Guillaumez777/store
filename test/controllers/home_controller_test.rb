require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "landing for guests" do
    get root_url
    assert_response :success
    assert_select ".landing-guest"
    assert_select ".task-list", count: 0
  end

  test "landing with grouped tasks when signed in" do
    sign_in_as users(:one)
    get root_url
    assert_response :success
    assert_select ".task-group", count: 2
    assert_select ".task-item", minimum: 1
    assert_select ".todo-form"
  end
end
