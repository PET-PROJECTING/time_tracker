module Permission
  extend ActiveSupport::Concern

  def is_admin?
    Admin::ApplicationController::ADMIN_TYPES.include?(current_user&.type)
  end

  def is_edit?
    params["action"] == "edit"
  end
end
