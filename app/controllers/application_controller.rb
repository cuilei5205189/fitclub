class ApplicationController < ActionController::Base
  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你不是管理员"
    end
  end
end
