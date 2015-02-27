class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  before_action :set_users, :only => [:index]

  #Enforces access right checks for individuals resources
  after_filter :verify_authorized

  # Enforces access right checks for collections
  after_filter :verify_policy_scoped, :only => :index

  def index
    authorize User
    if params[:approved] == "false"
      @users = @users.where(:approved => false)
    end

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

  #Not called. Replaced by
  def create
    @user = User.new(user_params)

    authorize @user
    @user.save

    respond_with(@user)
  end

  def update

    was_approved = @user.approved
    @user.update(user_params)
    if policy(current_user).set_roles?
      set_roles
    end

    if policy(current_user).approve?
      if !was_approved && @user.approved && @user.confirmed?
        AdminMailer.approved_notify(@user).deliver
      end
    end

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

    def set_roles
      @user.role_list.each do |role|
        @user.remove_role role
      end

      if params[:roles]
        params[:roles].each do |role|
          if current_user.super_admin || current_user.has_role?('institution-admin') || current_user.has_role?(role)  # Users can't set roles that they don't already have.
            puts "Adding Role #{role} to user #{@user.name}"
            @user.add_role role
          end
        end
      end
    end

    def user_params
      if current_user.super_admin
        params.require(:user).permit(:institution_id, :name, :email, :title, :department, :approved)
      else
        params.require(:user).permit(:name, :email, :title, :department, :approved)
      end
    end
end
