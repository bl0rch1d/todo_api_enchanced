describe Api::V1::Tasks::Operation::Destroy do
  let(:user) { create(:user, :with_project_with_task) }
  let(:result) { described_class.call(params: params, current_user: user) }
  let(:task) { user.projects.first.tasks.first }

  describe 'Success' do
    let(:params) { { id: task.id } }

    it { expect(result).to be_success }
  end

  describe 'Failure' do
    context 'when policy fails' do
      let(:params) { { id: create(:task).id } }

      it do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
