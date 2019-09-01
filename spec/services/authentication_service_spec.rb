RSpec.describe AuthenticationService do
  subject(:service) { described_class.new(params).call }

  let(:user) { create(:user) }

  context 'when success' do
    let(:params) { { username: user.username, password: user.password } }

    it 'authenticates user' do
      expect(service).to be_a(User)
    end
  end

  context 'when failure' do
    context 'when user not found' do
      let(:params) { { username: '', password: '' } }

      it { expect { service }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'when invalid password' do
      let(:params) { { username: user.username, password: '' } }

      it { expect { service }.to raise_error(JWTSessions::Errors::Unauthorized) }
    end
  end
end
