class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Valid request formats
  respond_to :html, :json


  # Devise filters
  before_filter  :authenticate_user!, :user_signed_in?, :current_user, :user_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :institution_id, :password, :password_confirmation) }
  end

  def is_approved
    unless current_user.approved
      redirect_to not_approved_users_path
    end
  end

  def access_level_at_least(access_level)
    #puts "Before Filter: access_level_at_least"

    unless current_user.access_level >= access_level
      redirect_to user_path(@current_user), :status => :unauthorized
    end
  end

  def user_is_super_admin
    unless current_user.super_admin
      redirect_to diagrams_path, :status => :unauthorized
    end
  end
end
