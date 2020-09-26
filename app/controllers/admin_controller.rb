class AdminController < ActionController::Base
  before_action :authenticate_user!
  before_action :admin_user_verify!

  layout 'application'

  private

  def admin_user_verify!
    return true if current_user.role == 'admin_user'
    redirect_to root_path, alert: 'you do not have any permitssion to access admin page'
  end
end
