class HomeController < ApplicationController
  allow_unauthenticated_access only: :index

  def index
    return unless authenticated?

    @todos = current_user.todos.recent
    @todo = current_user.todos.build
    @pending_todos = @todos.pending
    @completed_todos = @todos.completed
  end
end
