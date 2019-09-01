describe ProjectPolicy do
  subject(:policy) { described_class }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  permissions :create?, :update?, :show?, :destroy? do
    it 'denies access if project not owned by current_user' do
      expect(policy).not_to permit(user, build(:project))
    end

    it 'grants access if project belongs to current_user' do
      expect(policy).to permit(user, project)
    end
  end

  permissions '.scope' do
    it 'returns Projects that belong to Project owner' do
      expect(ProjectPolicy::Scope.new(user, Project.all).resolve).to include(project)
    end

    it 'does not return Projects that do not belong to Project owner' do
      expect(ProjectPolicy::Scope.new(User.new, Project.all).resolve).not_to include(project)
    end
  end
end
