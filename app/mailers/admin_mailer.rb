class AdminMailer < ActionMailer::Base
  default from: "ribbon-tool@iamstem.ucdavis.edu"

  helper :application

  def new_user_waiting_for_approval(user)
    @user = user

    recipients = [];

    User.where(:institution => @user.institution).each do |u|
      if u.has_role?('user-approve') || u.has_role?('institution-admin')
        recipients << u.email
      end
    end

    mail(:to => recipients, :subject => "Ribbon Tool - New User Approval Needed")
  end

  def approved_notify(user)
    @user = user

    mail(:to => @user.email, :subject => "Ribbon Tool - User Approved")
  end
end
