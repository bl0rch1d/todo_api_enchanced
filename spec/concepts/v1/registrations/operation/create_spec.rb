describe Api::V1::Registrations::Operation::Create do
  let(:result) { described_class.call(params: params) }

  describe 'Success' do
    let(:params) { { user: attributes_for(:user) } }

    it do
      expect(result['tokens']).to be_present
      expect(result).to be_success
    end
  end

  describe 'Failure' do
    context 'when validation fails' do
      let(:invalid_user_params) { { username: nil, password: nil } }
      let(:params) { { user: invalid_user_params } }

      it do
        expect(result['result.contract.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
