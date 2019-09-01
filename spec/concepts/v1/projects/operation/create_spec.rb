describe Api::V1::Projects::Operation::Create do
  let(:user) { create(:user, :with_project) }
  let(:result) { described_class.call(params: params, current_user: user) }

  describe 'Success' do
    let(:params) { { project: attributes_for(:project, user: user) } }

    it do
      expect(result['renderer_options']).to be_present
      expect(result).to be_success
    end
  end

  describe 'Failure' do
    context 'when validation fails' do
      let(:invalid_comment_params) { { name: '', user: user } }
      let(:params) { { project: invalid_comment_params } }

      it do
        expect(result['result.contract.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
