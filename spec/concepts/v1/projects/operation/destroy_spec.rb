describe Api::V1::Projects::Operation::Destroy do
  let(:user) { create(:user, :with_project) }
  let(:result) { described_class.call(params: params, current_user: user) }
  let(:project) { user.projects.first }

  describe 'Success' do
    let(:params) { { id: project.id } }

    it { expect(result).to be_success }
  end

  describe 'Failure' do
    context 'when policy fails' do
      let(:params) { { id: create(:project).id } }

      it do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
