class HomePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def destroy?
    record.owner == user
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    record.owner == user
  end

  def edit?
    update?
  end

  def is_owner?
    record.owner == user
  end
end
