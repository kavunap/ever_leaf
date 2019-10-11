class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :only_see_own_page, only: [:show]
  # before_action :only_create_user_when_none_signed_in, only: [:new, :create]
  before_action :give_users_right_to_admin, only: [:index]
  before_action :check_before_delete, only: [:destroy]
  # GET /users
  def index
    @users = User.all
  end
  def admin
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    #unless current_user
      @user = User.new(user_params)

      if @user.save
        #session[:user_id] = @user.id
        redirect_to tasks_url, notice: 'User was successfully created.'
      else
        render :new
      end
    #end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy 
    @users = User.all
    i = 0
    @users.each do |user|
      if user.user_type == "admin"
        i += 1
      end
      
    end
    @admins = i
    if @user.id == current_user.id
      redirect_to root_url, notice: "You can not delete signed in user"
    elsif @admins == 1
      redirect_to root_url, notice: "Atleast on admin must remain!"
    else
      @user.destroy
      redirect_to admin_users_url, notice: 'User was successfully destroyed.'
    end
  end
  def admin 
    user = User.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :user_type, :password, :password_confirmation)
    end
    def i_am_still_here
      current_user.update(last_seen_at:DateTime.now)
    end


def only_see_own_page
  @user = User.find(params[:id])

  if current_user != @user
    redirect_to users_path, notice: "Sorry, but you are only allowed to view your own profile page."
  end
end

def only_create_user_when_none_signed_in
  if current_user
    redirect_to users_path,  notice: "you can't create user when signed in"
  end
end
  def give_users_right_to_admin
    unless current_user && current_user.user_type == "admin"
      redirect_to root_url, notice: "only admin user can access this page"
    end
  end
 
end
