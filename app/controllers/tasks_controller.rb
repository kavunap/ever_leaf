class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column
  before_action :authorize, only: [:edit, :update, :destroy]
  # GET /tasks
  def index
    #@tasks = Task.all.order("created_at DESC")
    if params[:search]
      @tasks = Task.search(params[:search]).order("created_at DESC").page params[:page]
    else
      #@tasks = Task.order(:created_at).page(params[:page])
      @tasks = Task.order_list(params[:sort_by]).page params[:page]
    end

    case params[:sort]
    when 'start_date'
      @tasks = Task.where(['start_date = ? or start_date > ?', DateTime.now, DateTime.now]).order('start_date asc')
        .order(:start_date).paginate(:page => params[:page], :per_page => 2)
    when 'content'
      @tasks = Task.where(['start_date = ? or start_date > ?', DateTime.now, DateTime.now]).order('content asc')
        .order(:start_date).paginate(:page => params[:page], :per_page => 2)
    when 'status'
    #else
      @tasks = Task.where(['start_date = ? or start_date > ?', DateTime.now, DateTime.now]).order('status asc')
      .paginate(:page => params[:page], :per_page => 2)
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
      redirect_to tasks_url, notice: t('tasks.success')
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
    # def sort_priority
    #   %w[asc desc].include?(params[:priority]) ? params[:priority] : 'asc'
    # end
    def sort_column
      params[:sort] if params[:sort]
    end

    # def is_signed_in?
    #   if !user_signed_in?
    #      redirect_to new_user_session_path
    #   else 
    #      ..proceed to the action intended to call
    #   end
    # end
end
