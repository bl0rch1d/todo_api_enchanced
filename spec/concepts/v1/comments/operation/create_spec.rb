describe Api::V1::Comments::Operation::Create do
  let(:user) { create(:user, :with_project_with_task) }
  let(:result) { described_class.call(params: params, current_user: user) }
  let(:task) { user.projects.first.tasks.first }

  describe 'Success' do
    let(:params) { { comment: attributes_for(:comment, task: task), task_id: task.id } }

    it do
      expect(result['renderer_options']).to be_present
      expect(result).to be_success
    end
  end

  describe 'Failure' do
    context 'when Comment not found' do
      let(:params) { { comment: attributes_for(:comment, task: task), task_id: nil } }

      it { expect { result }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'when policy fails' do
      let(:params) { { comment: attributes_for(:comment, task: task), task_id: create(:task).id } }

      it do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end

    context 'when validation fails' do
      let(:invalid_comment_params) { { body: '', task: task } }
      let(:params) { { comment: invalid_comment_params, task_id: task.id } }

      it do
        expect(result['result.contract.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
