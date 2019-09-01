describe Api::V1::Tasks::Operation::Create do
  let(:user) { create(:user, :with_project_with_task) }
  let(:result) { described_class.call(params: params, current_user: user) }
  let(:project) { user.projects.first }

  describe 'Success' do
    let(:params) { { task: attributes_for(:task, project: project), project_id: project.id } }

    it do
      expect(result['renderer_options']).to be_present
      expect(result).to be_success
    end
  end

  describe 'Failure' do
    context 'when Project not found' do
      let(:params) { { task: attributes_for(:task, project: project), project_id: nil } }

      it { expect { result }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'when policy fails' do
      let(:params) { { task: attributes_for(:task, project: project), project_id: create(:project).id } }

      it do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end

    context 'when validation fails' do
      let(:invalid_task_params) { { name: '' } }
      let(:params) { { task: invalid_task_params, project_id: project.id } }

      it do
        expect(result['result.contract.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
