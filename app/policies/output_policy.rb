class OutputPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # to False as not really needed at this point

  def show?
    true
  end

  def new?
    false
  end

  def create?
    false
  end
end
