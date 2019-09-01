describe Api::V1::Registrations::Contract::Create do
  let(:contract) { described_class.new(User.new) }

  describe 'Success' do
    let(:params) { attributes_for(:user) }

    it { expect(contract.validate(params)).to be_truthy }
  end

  describe 'Failure' do
    let(:params) { attributes_for(:project) }

    let(:errors) do
      {
        username: [
          I18n.t('errors.messages.blank'),
          I18n.t('errors.messages.too_short.other', count: User::USERNAME_LENGTH_RANGE.min)
        ],
        password: [
          I18n.t('errors.messages.blank'),
          I18n.t('errors.messages.too_short.other', count: User::PASSWORD_RANGE.min)
        ]
      }
    end

    it 'returns errors' do
      expect(contract.validate(params)).to be_falsey
      expect(contract.errors.messages).to match(errors)
    end
  end
end
