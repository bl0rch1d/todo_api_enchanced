describe Api::V1::Projects::Operation::Update do
  let(:user) { create(:user, :with_project) }
  let(:result) { described_class.call(params: params, current_user: user) }
  let(:project) { user.projects.first }

  describe 'Success' do
    let(:params) { { project: attributes_for(:project, user: user), id: project.id } }

    it do
      expect(result['renderer_options']).to be_present
      expect(result).to be_success
    end
  end

  describe 'Failure' do
    context 'when Project not found' do
      let(:params) { { project: attributes_for(:project, user: user), id: nil } }

      it do
        expect(result).to be_failure
        expect(result['model']).to be_nil
      end
    end

    context 'when policy fails' do
      let(:params) { { project: attributes_for(:project, user: user), id: create(:project).id } }

      it do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end

    context 'when validation fails' do
      let(:invalid_project_params) { { name: '', user: user } }
      let(:params) { { project: invalid_project_params, id: project.id } }

      it do
        expect(result['result.contract.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
