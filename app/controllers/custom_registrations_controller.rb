class CustomRegistrationsController < Devise::RegistrationsController
  prepend_view_path "app/views/devise"

  def create
    super

    #if User.where("access_level >= 1").count > 0
    #  UserMailer.approval_needed(@user).deliver
    #end
  end

  def update
    super
  end
end