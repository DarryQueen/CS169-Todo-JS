class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.completed = !@todo.completed
    @todo.save

    redirect_to root_path
  end

  private
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params.require(:todo).permit(:description)
  end
end
