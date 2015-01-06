class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:index]

  def index
    respond_with(@users)
  end

  def show
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.save

    #TEMPORARY for TEA Demo
    diagram = Diagram.where(:name => "Randomized Demo Data")
    if @user.save
      UserDiagram.new(:diagram => diagram, :user => @user).save!
    end
    #End TEMPORARY

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
    end

    def set_users
      if current_user.super_admin
        @users = User.all
      else
        @users = User.where(:institution_id => current_user.institution_id)
      end
    end

    def user_params
      params.require(:user).permit(:institution_id, :access_level, :access_level_desc, :name, :email)
    end
end
