describe Api::V1::Comments::Operation::Destroy do
  let(:user) { create(:user, :with_project_with_task_with_comments) }
  let(:result) { described_class.call(params: params, current_user: user) }
  let(:comment) { user.projects.first.tasks.first.comments.first }

  describe 'Success' do
    let(:params) { { id: comment.id } }

    it { expect(result).to be_success }
  end

  describe 'Failure' do
    context 'when Comment not found' do
      let(:params) { { id: nil } }

      it { expect { result }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'when policy fails' do
      let(:params) { { id: create(:comment).id } }

      it do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
