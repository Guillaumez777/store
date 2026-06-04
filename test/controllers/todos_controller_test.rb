require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in_as @user
    @todo = todos(:one)
  end

  test "create" do
    assert_difference("@user.todos.count") do
      post todos_url, params: { todo: { title: "Nouvelle tâche" } }
    end
    assert_redirected_to root_url
  end

  test "update" do
    patch todo_url(@todo), params: { todo: { completed: true } }
    assert_redirected_to root_url
    assert @todo.reload.completed?
  end

  test "destroy" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end
    assert_redirected_to root_url
  end
end
