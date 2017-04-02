class TodosController < ApplicationController
  def index
    @todos = Todo.where(:completed => false, :user_id => current_user.id)
    @completed_todos = Todo.where(:completed => true, :user_id => current_user.id)
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = current_user.todos.build
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      redirect_to todos_path
    else
      render :show
    end
  end

  def completed
    @todo = Todo.find(params[:id])
    if @todo.update(:completed => true)
      redirect_to todos_path
    else
      render :show
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name)
  end
end
