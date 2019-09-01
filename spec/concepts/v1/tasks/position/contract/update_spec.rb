describe Api::V1::Tasks::Position::Contract::Update do
  let(:contract) { described_class.new(create(:task)) }

  let(:valid_position) { rand(1..5) }

  describe 'Success' do
    let(:params) { { posiiton: valid_position } }

    it { expect(contract.validate(params)).to be_truthy }
  end
end
