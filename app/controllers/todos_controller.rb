class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "task was sucessfully created!"
    else
      flash[:warning] = "provide a task description"
    end
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.completed = !@todo.completed
    @todo.save

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
