class UserDiagramsController < ApplicationController
  before_action :set_user_diagram, :only => [:show, :edit, :update, :destroy]
  before_action :set_user_diagrams, :only => [:index]

  #Enforces access right checks for individuals resources
  after_filter :verify_authorized

  # Enforces access right checks for collections
  after_filter :verify_policy_scoped, :only => :index

  def index
    authorize Diagram
    respond_with(@user_diagrams)
  end

  def show
    respond_with(@user_diagram)
  end

  def new
    @user_diagram = UserDiagram.new

    authorize @user_diagram

    respond_with(@user_diagram)
  end

  def edit
  end

  def create
    @user_diagram = UserDiagram.new(user_diagram_params)

    authorize @user_diagram
    @user_diagram.save

    respond_with(@user_diagram)
  end

  def update
    @user_diagram.update(user_diagram_params)
    respond_with(@user_diagram)
  end

  def destroy
    @user_diagram.destroy
    respond_with(@user_diagram)
  end

  private
    def set_user_diagram
      @user_diagram = UserDiagram.find(params[:id])
      authorize @user_diagram
    end

    def set_user_diagrams
      @user_diagrams = policy_scope(UserDiagram)
    end

    def user_diagram_params
      params.require(:user_diagram).permit(:user_id, :diagram_id)
    end
end
