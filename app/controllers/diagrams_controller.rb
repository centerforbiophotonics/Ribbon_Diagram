class DiagramsController < ApplicationController
  before_action :set_diagram, :only => [:show, :edit, :update, :destroy, :download, :share_with_institution, :share_with_only_me]
  before_action :set_diagrams, :only => [:index]

  before_action :user_can_access_diagram, :only => [:show, :download]
  before_action :user_created_diagram, :only => [:destroy, :share_with_institution, :edit, :update, :share_with_only_me]

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

  def share_with_institution
    User.where(:institution => @diagram.creator.institution).each do |user|
      unless UserDiagram.where(:user => user).where(:diagram => @diagram).exists?
        UserDiagram.new(:diagram => @diagram, :user => user).save!
      end
    end

    redirect_to :back
  end

  def share_with_only_me
    UserDiagram.where(:diagram => @diagram).each do |ud|
      if ud.user != @diagram.creator
        ud.destroy
      end
    end
    redirect_to :back
  end

  def update
    @diagram.update(diagram_params)

    #Check diagram data_format and remove data_files that don't belong to the format
    
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

    def user_created_diagram
      unless @diagram.creator == current_user || current_user.super_admin
        render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
      end
    end
end
