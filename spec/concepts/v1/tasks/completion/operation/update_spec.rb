describe Api::V1::Tasks::Completion::Operation::Update do
  let(:user) { create(:user, :with_project_with_task) }
  let(:result) { described_class.call(params: params, current_user: user) }
  let(:task) { user.projects.first.tasks.first }

  describe 'Success' do
    let(:params) { { task_id: task.id } }

    it do
      expect(result['model'].completed).to be_truthy
      expect(result['renderer_options']).to be_present
      expect(result).to be_success
    end
  end

  describe 'Failure' do
    context 'when Task not found' do
      let(:params) { { task_id: nil } }

      it do
        expect(result).to be_failure
        expect(result['model']).to be_nil
      end
    end

    context 'when policy fails' do
      let(:params) { { task_id: create(:task).id } }

      it do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
