class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  
    def index
      @tasks = if params[:term]
        Task.where('status LIKE ? or name LIKE ?', "%#{params[:term]}%","%#{params[:term]}%").page params[:page]
      elsif params[:term1]
        Task.where('name LIKE ?', "%#{params[:term1]}%").page params[:page]
      elsif params[:term2]
        Task.where('status LIKE ?', "%#{params[:term2]}%").page params[:page]
      elsif params[:term3]
        Task.joins(:labels)
          .where("labels.title ILIKE ?", "%#{params[:term3]}%").page params[:page]
      else
        @tasks = Task.order_list(params[:sort_by]).page params[:page]
      end
    end
    def search
      @task =task.search(params[:search])
    end
    

 

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
    @task.user_id = current_user.id
    @task.labels.build
    @task.tasks_labels.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)
    @task.user_id = current_user.id
    #@task.labels.build(task_params)
    @labels= Label.all
    if @task.save
      redirect_to tasks_url, notice: t('tasks.success')
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to tasks_url, notice: ('tasks.update')

    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: t('tasks.destroy')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      #params.require(:task).permit(:name, :content, :status, :priority, :start_date, :end_date, :term, :term1, :term2, label_id:[], label:[])
      params.require(:task).permit([:name, :content, :status, :priority, :start_date, :end_date,
       :term, :term1, :term2, label_ids: []])
    end
    
<<<<<<< HEAD
    

   
=======
>>>>>>> 0be85a9bf82a50e264446364bfa40d87a120b3d9
end
