class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
    @current_user = current_user
    @user = user
  end

  def index?
    true
  end

  def show?
    user_in_same_institution_as_current_user || user_is_super_admin
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    user_is_super_admin
  end

  def edit?
    user_is_super_admin
  end

  def destroy?
    user_is_super_admin
  end

  def user_in_same_institution_as_current_user
    user.institution == current_user.institution
  end

  class Scope < Scope
    attr_reader :current_user, :scope

    def initialize(current_user, scope)
      @current_user = current_user
      @scope = scope
    end

    def resolve
      if user_is_super_admin
        scope.all
      else
        scope.where(:institution_id => current_user.institution_id)
      end
    end
  end
end
