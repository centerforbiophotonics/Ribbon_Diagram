class DiagramsController < ApplicationController
  before_action :set_diagram, :only => [:show, :edit, :update, :destroy, :download]
  before_action :set_diagrams, :only => [:index]

  def index
    respond_with(@diagrams)
  end

  def show
    respond_with(@diagram)
  end

  def new
    @diagram = Diagram.new
    respond_with(@diagram)
  end

  def edit
  end

  def create
    @diagram = Diagram.new(diagram_params)
    @diagram.institution = current_user.institution
    @diagram.created_by = current_user.id

    if @diagram.save
      UserDiagram.new(:diagram => @diagram, :user => current_user).save!
    end

    respond_with(@diagram)
  end

  def update
    @diagram.update(diagram_params)
    respond_with(@diagram)
  end

  def destroy
    @diagram.destroy
    respond_with(@diagram)
  end

  def local


  end

  def download
    send_data @diagram.data_file.expiring_url(10), :filename => @diagram.data_file.original_filename
  end

  private
    def set_diagram
      @diagram = Diagram.find(params[:id])
    end

    def set_diagrams
      if current_user.super_admin
        @diagrams = Diagram.all
      else
        @diagrams = current_user.diagrams
      end
    end

    def diagram_params
      params.require(:diagram).permit(:data_file, :data_format,  :name, :category)
    end
end
