class TodosController < ApplicationController
  before_action :set_todo, only: %i[ update destroy ]

  def create
    @todo = current_user.todos.build(todo_params)
    

    if @todo.save
      redirect_to root_path, notice: t("todos.created")
    else
      redirect_to root_path, alert: @todo.errors.full_messages.to_sentence
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to root_path, notice: t("todos.updated")
    else
      redirect_to root_path, alert: @todo.errors.full_messages.to_sentence
    end
  end

  def destroy
    @todo.destroy!
    redirect_to root_path, notice: t("todos.destroyed"), status: :see_other
  end

  private
    def set_todo
      @todo = current_user.todos.find(params.expect(:id))
    end

    def todo_params
      params.expect(todo: [ :title, :completed ])
    end
end
