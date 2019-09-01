describe CommentPolicy do
  subject(:policy) { described_class }

  let(:user) { create(:user, :with_project_with_task_with_comments) }
  let(:comment) { user.projects.first.tasks.first.comments.first }

  permissions :create?, :show?, :destroy? do
    it 'denies access if Comment not owned by current_user' do
      expect(policy).not_to permit(user, build(:comment))
    end

    it 'grants access if Comment belongs to current_user' do
      expect(policy).to permit(user, comment)
    end
  end

  permissions '.scope' do
    it 'returns Comment that belong to Comment owner' do
      expect(CommentPolicy::Scope.new(user, Comment.all).resolve).to include(comment)
    end

    it 'does not return Comment that do not belong to Comment owner' do
      expect(CommentPolicy::Scope.new(User.new, Comment.all).resolve).not_to include(comment)
    end
  end
end
