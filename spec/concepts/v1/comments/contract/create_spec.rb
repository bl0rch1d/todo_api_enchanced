describe Api::V1::Comments::Contract::Create do
  let(:contract) { described_class.new(Comment.new) }

  describe 'Success' do
    let(:params) { attributes_for(:comment) }

    it { expect(contract.validate(params)).to be_truthy }
  end

  describe 'Failure' do
    let(:params) { attributes_for(:user) }

    let(:errors) do
      {
        body: [
          I18n.t('errors.messages.blank'),
          I18n.t('errors.messages.too_short.other', count: Comment::BODY_LENGTH_RANGE.min)
        ]
      }
    end

    it 'returns errors' do
      expect(contract.validate(params)).to be_falsey
      expect(contract.errors.messages).to match(errors)
    end
  end
end
