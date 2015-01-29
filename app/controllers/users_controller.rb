class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  before_action :set_users, :only => [:index]

  #Enforces access right checks for individuals resources
  after_filter :verify_authorized

  # Enforces access right checks for collections
  after_filter :verify_policy_scoped, :only => :index

  def index
    authorize User
    respond_with(@users)
  end

  def show
    respond_with(@user)
  end

  def new
    @user = User.new

    authorize @user

    respond_with(@user)
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    authorize @user
    @user.save

    respond_with(@user)
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

    def set_users
      @users = policy_scope(User)
    end

    def user_params
      params.require(:user).permit(:institution_id, :access_level, :access_level_desc, :name, :email, :title, :department)
    end
end
