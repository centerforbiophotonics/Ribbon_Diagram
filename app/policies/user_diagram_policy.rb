class UserDiagramPolicy < ApplicationPolicy
  attr_reader :user, :user_diagram

  def initialize(user, user_diagram)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @user_diagram = user_diagram
  end

  def index?
    user_is_super_admin
  end

  def show?
    user_is_super_admin
  end

  def create?
    user_is_super_admin || user_authored_diagram_in_association
  end

  def new?
    create?
  end

  def update?
    user_is_super_admin || user_authored_diagram_in_association
  end

  def edit?
    update?
  end

  def destroy?
    user_is_super_admin || user_authored_diagram_in_association
  end

  def user_authored_diagram_in_association
    user.authored_diagrams.include(user_diagram.diagram)
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
