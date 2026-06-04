class HomeController < ApplicationController
  allow_unauthenticated_access only: :index

  def index
    if authenticated?
      @todos = current_user.todos.recent
      @todo = current_user.todos.build
      @pending_count = @todos.pending.count
      @completed_count = @todos.completed.count
    end

    @products = Product.order(created_at: :desc).limit(6)
  end
end
