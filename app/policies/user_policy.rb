class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def homes_not_zero?(my_homes)
    my_homes.size.positive?
  end
end
