# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  include Permission

  def update?
    not_accepted?
  end

  def edit?
    not_accepted?
  end

  def destroy?
    admin? && not_accepted?
  end

  private

  def admin?
    Admin::ApplicationController::ADMIN_TYPES.include?(user&.type)
  end

  def not_accepted?
    !record.accepted?
  end
end
