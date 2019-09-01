describe TaskPolicy do
  subject(:policy) { described_class }

  let(:user) { create(:user, :with_project_with_task) }
  let(:task) { user.projects.first.tasks.first }

  permissions :create?, :update?, :show?, :destroy? do
    it 'denies access if Task not owned by current_user' do
      expect(policy).not_to permit(user, build(:task))
    end

    it 'grants access if Task belongs to current_user' do
      expect(policy).to permit(user, task)
    end
  end

  permissions '.scope' do
    it 'returns Task that belong to Task owner' do
      expect(TaskPolicy::Scope.new(user, Task.all).resolve).to include(task)
    end

    it 'does not return Task that do not belong to Task owner' do
      expect(TaskPolicy::Scope.new(User.new, Task.all).resolve).not_to include(task)
    end
  end
end
