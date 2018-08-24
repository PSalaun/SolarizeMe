class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where("crowdfunding_end_date > ?", Date.today)
    end
  end

  def show?
    true
  end


end
