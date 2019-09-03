describe Api::V1::Sessions::Operation::Create do
  let(:user) { create(:user) }
  let(:result) { described_class.call(params: params) }

  describe 'Success' do
    let(:params) { { username: user.username, password: user.password } }

    it do
      expect(result['tokens']).to be_present
      expect(result).to be_success
    end
  end

  describe 'Failure' do
    context 'when User not found' do
      let(:params) { { username: FFaker::Lorem.word, password: user.password } }

      it do
        expect(result).to be_failure
        expect(result['model']).to be_nil
      end
    end

    context 'when User not authenticated' do
      let(:params) { { username: user.username, password: FFaker::Lorem.word } }

      it do
        expect(result).to be_failure
        expect(result['authenticated']).to be_falsey
      end
    end
  end
end
