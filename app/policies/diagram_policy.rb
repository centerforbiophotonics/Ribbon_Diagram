class DiagramPolicy < ApplicationPolicy
  attr_reader :user, :diagram

  def initialize(user, diagram)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @diagram = diagram
  end

  def index?
    true
  end

  def show?
    diagram_is_shared_with_user || diagram_is_created_by_user || user_is_super_admin
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    diagram_is_created_by_user || user_is_super_admin
  end

  def edit?
    diagram_is_created_by_user || user_is_super_admin
  end

  def destroy?
    diagram_is_created_by_user || user_is_super_admin
  end


  # custom actions
  def share_with_only_me?
    diagram_is_created_by_user || user_is_super_admin
  end

  def share_with_institution?
    diagram_is_created_by_user || user_is_super_admin
  end

  def download?
    diagram_is_shared_with_user || user_is_super_admin
  end



  def diagram_is_shared_with_user
    user.diagrams.include?(diagram)
  end

  def diagram_is_created_by_user
    diagram.creator == user
  end



  class Scope < Scope
    def resolve
      user.diagrams | user.authored_diagrams
    end
  end
end
