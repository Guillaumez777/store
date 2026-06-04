require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in_as @user
    @todo = todos(:one)
  end

  test "create todo" do
    assert_difference("@user.todos.count") do
      post todos_url, params: { todo: { title: "Nouvelle tâche" } }
    end

    assert_redirected_to "#{root_url}#todos"
  end

  test "update todo" do
    patch todo_url(@todo), params: { todo: { completed: true } }
    assert_redirected_to "#{root_url}#todos"
    assert @todo.reload.completed?
  end

  test "destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to "#{root_url}#todos"
  end

  test "cannot access another users todo" do
    other_todo = todos(:three)
    patch todo_url(other_todo), params: { todo: { completed: true } }
    assert_response :not_found
  end
end
