class AccessLevelPolicy < ApplicationPolicy
  attr_reader :user, :access_level

  def initialize(user, access_level)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @access_level = access_level
  end

  def index?
    user_is_super_admin
  end

  def show?
    scope.where(:id => access_level.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      if user.super_admin
        scope.all
      else
        scope.where(:institution_id => current_user.institution_id)
      end
    end
  end
end
