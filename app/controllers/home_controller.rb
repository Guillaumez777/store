class HomeController < ApplicationController
  allow_unauthenticated_access only: :index

  def index
    return unless authenticated?

    @todos = current_user.todos.recent
    @todo = current_user.todos.build
    @pending_todos = @todos.pending
    @completed_todos = @todos.completed
    puts "dd index home depuis le puts home, #{@todos}"
  end
end
