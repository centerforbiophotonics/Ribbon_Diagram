class CustomRegistrationsController < Devise::RegistrationsController
  prepend_view_path "app/views/devise"

  def create
    super

    #if User.where("access_level >= 1").count > 0
    #  UserMailer.approval_needed(@user).deliver
    #end

    #TEMPORARY for TEA Demo
    diagram = Diagram.where(:name => "Randomized Demo Data")[0]
    if @user.save
      UserDiagram.new(:diagram => diagram, :user => @user).save!
    end
    #End TEMPORARY
  end

  def update
    super
  end
end