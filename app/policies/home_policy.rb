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

  def owner?
    record.owner == user
  end

  def logged_in?
    !user.nil?
  end

  def listing_with_home?
    Listing.where(home_id: record.id, student_id: user.id).first != nil
  end

  def liked?
    if listing_with_home?
      Listing.where(home_id: record.id, student_id: user.id).first.student_like == true
    else
      false
    end
  end
end
