class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:project).where(projects: { user: user })
    end
  end

  def legit_owner?
    user == record.project.user
  end
end
