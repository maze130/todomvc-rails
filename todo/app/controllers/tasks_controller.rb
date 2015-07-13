class TasksController < ApplicationController

  def index
    @list = List.find_by(id: params[:list_id])
  end

  def new
    @task = Task.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    task = Task.new(task_params)
    list = List.find_by(id: params[:list_id]).tasks << task
    task.save
    redirect_to list_tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end

end
