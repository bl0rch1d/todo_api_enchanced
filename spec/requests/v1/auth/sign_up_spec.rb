RSpec.describe 'Sign up API', type: :request do
  include Docs::V1::Registrations::Api

  let(:valid_username) { FFaker::Lorem.words(2).join }

  describe 'POST /auth/registrations' do
    include Docs::V1::Registrations::Create

    before { post api_v1_auth_registrations_path, params: params }

    context 'with valid params' do
      let(:params) { { user: attributes_for(:user) } }

      it 'created', :dox do
        expect(response).to have_http_status(201)
      end

      it 'creates the user and session' do
        expect(response.cookies[JWTSessions.access_cookie]).to be_present
        expect(response).to match_json_schema('registrations/csrf_token')
      end
    end

    context 'with invalid params' do
      let(:params) { { user: { username: nil, password: nil } } }

      it 'unprocessable', :dox do
        expect(response).to have_http_status(422)
      end

      it 'does not create a session' do
        expect(response.cookies[JWTSessions.access_cookie]).not_to be_present
        expect(response).to match_json_schema('registrations/validation_errors')
      end
    end
  end
end
