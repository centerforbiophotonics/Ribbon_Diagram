class AccessLevelsController < ApplicationController
  before_action :set_access_level, only: [:show, :edit, :update, :destroy]

  def index
    @access_levels = AccessLevel.all
    respond_with(@access_levels)
  end

  def show
    respond_with(@access_level)
  end

  def new
    @access_level = AccessLevel.new
    respond_with(@access_level)
  end

  def edit
  end

  def create
    @access_level = AccessLevel.new(access_level_params)
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
    end

    def access_level_params
      params.require(:access_level).permit(:code, :description, :institution_id)
    end
end
