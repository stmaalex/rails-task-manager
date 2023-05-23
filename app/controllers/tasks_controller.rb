class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    id = params[:id]
    @task = Task.find(id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_permitted_params)
    @task.save
    redirect_to(task_path(@task.id))
  end

  def edit
    id = params[:id]
    @task = Task.find(id)
  end

  def update
    id = params[:id]
    @task = Task.find(id)
    @task.update(task_permitted_params)
    redirect_to(task_path(@task.id))
  end

  def destroy
    id = params[:id]
    @task = Task.find(id)
    @task.delete
    redirect_to(task_path)
  end
end

private

def task_permitted_params
  params.require(:task).permit(:title, :details)
end
