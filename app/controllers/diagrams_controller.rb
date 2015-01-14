class DiagramsController < ApplicationController
  before_action :set_diagram, :only => [:show, :edit, :update, :destroy, :download]
  before_action :set_diagrams, :only => [:index]

  before_action :user_can_access_diagram, :only => [:show, :edit, :update, :destroy, :download]

  def index
    respond_with(@diagrams)
  end

  def show
    respond_with(@diagram)
  end

  def new
    @diagram = Diagram.new
    2.times do
      @diagram.data_files.build
    end
    respond_with(@diagram)
  end

  def edit
  end

  def create
    @diagram = Diagram.new(diagram_params)
    @diagram.institution = current_user.institution
    @diagram.creator = current_user

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
    puts "#####################"
    puts params[:data_file_id]
    puts "#####################"

    redirect_to @diagram.data_files.find(params[:data_file_id].to_i).data_file.expiring_url(10), :filename => @diagram.data_files.find(params[:data_file_id].to_i).data_file.original_filename
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
      params.require(:diagram).permit(:data_format, :name, :category, :data_files_attributes => [:id, :data_file, :name])
    end

    def user_can_access_diagram
      unless current_user.diagrams.include?(@diagram) || current_user.super_admin
        render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
      end
    end
end
