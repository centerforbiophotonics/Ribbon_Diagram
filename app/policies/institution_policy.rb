class InstitutionPolicy < ApplicationPolicy
  attr_reader :user, :institution

  def initialize(current_user, user)
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
    @current_user = current_user
    @user = user
  end

  def index?
    user_is_super_admin
  end

  def show?
    user_is_super_admin
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

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
