class CommentPolicy < ApplicationPolicy

  def create?
    user.present? && (record.user == user || user.role?(:admin))
  end

  def destroy?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end
end