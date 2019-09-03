describe Api::V1::Tasks::Contract::Create do
  let(:contract) { described_class.new(Task.new) }

  describe 'Success' do
    let(:params) { attributes_for(:task) }

    it { expect(contract.validate(params)).to be_truthy }
  end

  describe 'Failure' do
    let(:params) { attributes_for(:user) }

    let(:errors) { { name: [I18n.t('errors.messages.blank')] } }

    it 'returns errors' do
      expect(contract.validate(params)).to be_falsey
      expect(contract.errors.messages).to match(errors)
    end
  end
end