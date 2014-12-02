class UserDiagramsController < ApplicationController
  before_action :set_user_diagram, only: [:show, :edit, :update, :destroy]

  def index
    @user_diagrams = UserDiagram.all
    respond_with(@user_diagrams)
  end

  def show
    respond_with(@user_diagram)
  end

  def new
    @user_diagram = UserDiagram.new
    respond_with(@user_diagram)
  end

  def edit
  end

  def create
    @user_diagram = UserDiagram.new(user_diagram_params)
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
    end

    def user_diagram_params
      params.require(:user_diagram).permit(:user_id, :diagram_id)
    end
end
