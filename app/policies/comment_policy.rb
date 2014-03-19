class CommentPolicy < ApplicationPolicy
  
  def create?
    user.present? || user.role?(:admin) || user.role?(:moderator)
  end
end

# Checkpoint 19 Comments