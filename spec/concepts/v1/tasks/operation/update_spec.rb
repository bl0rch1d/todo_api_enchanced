describe Api::V1::Tasks::Operation::Update do
  let(:user) { create(:user, :with_project_with_task) }
  let(:result) { described_class.call(params: params, current_user: user) }
  let(:task) { user.projects.first.tasks.first }

  let(:valid_task_params) { { name: FFaker::Lorem.words(2).join } }
  let(:invalid_task_params) { { name: '' } }

  describe 'Success' do
    let(:params) { { task: valid_task_params, id: task.id } }

    it do
      expect(result['renderer_options']).to be_present
      expect(result).to be_success
    end
  end

  describe 'Failure' do
    context 'when Project not found' do
      let(:params) { { task: valid_task_params, id: nil } }

      it { expect { result }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'when policy fails' do
      let(:params) { { task: valid_task_params, id: create(:task).id } }

      it do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end

    context 'when validation fails' do
      let(:params) { { task: invalid_task_params, id: task.id } }

      it do
        expect(result['result.contract.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
