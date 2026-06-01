class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
    @comment = Comment.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      @tasks = Task.all
      render :index
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :done, :description, :priority, :deadline)
  end
end