class TasksController < ApplicationController
  helper_method :sort_priority
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    #@tasks = Task.all.order("created_at DESC")
    if params[:search]
      @tasks = Task.search(params[:search]).order("created_at DESC")
    else
      @tasks = Task.all.order('created_at DESC')
    end
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_url, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to tasks_url, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :content, :status, :priority, :start_date, :end_date, :user_id)
    end
    def sort_priority
      %w[asc desc].include?(params[:priority]) ? params[:priority] : 'asc'
    end
end
