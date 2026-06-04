require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "index without authentication" do
    get root_url
    assert_response :success
    assert_select "section#todos .guest-card"
    assert_select "section#accueil h1"
  end

  test "index with authentication shows todos" do
    sign_in_as users(:one)
    get root_url
    assert_response :success
    assert_select ".todo-item", minimum: 1
    assert_select ".todo-form"
  end
end
