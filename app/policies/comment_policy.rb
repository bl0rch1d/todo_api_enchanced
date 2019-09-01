class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(task: :project).where(tasks: { projects: { user: @user } })
    end
  end

  def legit_owner?
    user == record.task.project.user
  end
end
