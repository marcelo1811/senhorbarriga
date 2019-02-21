class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def new?
    true
  end

  def create?
    true
  end

  def owner_like?
    true
  end

  def liked_as_owner?
    record.owner_like
  end
end
