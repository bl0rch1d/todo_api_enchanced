describe Api::V1::Projects::Operation::Show do
  let(:user) { create(:user, :with_project) }
  let(:result) { described_class.call(params: params, current_user: user) }
  let(:project) { user.projects.first }

  describe 'Success' do
    let(:params) { { id: project.id } }

    it do
      expect(result['renderer_options']).to be_present
      expect(result).to be_success
    end
  end

  describe 'Failure' do
    context 'when Project not found' do
      let(:params) { { id: nil } }

      it { expect { result }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'when policy fails' do
      let(:params) { { id: create(:project).id } }

      it do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
