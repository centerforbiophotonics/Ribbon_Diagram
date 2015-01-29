class AccessLevelsController < ApplicationController
  before_action :set_access_level, :only => [:show, :edit, :update, :destroy]
  before_action :set_access_levels, :only => [:index]

  #Enforces access right checks for individuals resources
  after_filter :verify_authorized

  # Enforces access right checks for collections
  after_filter :verify_policy_scoped, :only => :index

  def index
    authorize AccessLevel
    respond_with(@access_levels)
  end

  def show
    respond_with(@access_level)
  end

  def new
    @access_level = AccessLevel.new

    authorize @access_level

    respond_with(@access_level)
  end

  def edit
  end

  def create
    @access_level = AccessLevel.new(access_level_params)

    authorize @access_level
    @access_level.save

    respond_with(@access_level)
  end

  def update
    @access_level.update(access_level_params)
    respond_with(@access_level)
  end

  def destroy
    @access_level.destroy
    respond_with(@access_level)
  end

  private
    def set_access_level
      @access_level = AccessLevel.find(params[:id])
      authorize @access_level
    end

    def set_access_levels
      @access_levels = policy_scope(AccessLevel)
    end

    def access_level_params
      params.require(:access_level).permit(:code, :description, :institution_id)
    end
end
