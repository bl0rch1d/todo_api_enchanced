RSpec.describe 'Sign in API', type: :request do
  include Docs::V1::Sessions::Api

  let!(:user) { create(:user) }

  describe 'POST /auth/sessions' do
    include Docs::V1::Sessions::Create

    before { post api_v1_auth_sessions_path, params: params }

    context 'with valid params' do
      let(:params) { { username: user.username, password: user.password } }

      it 'success', :dox do
        expect(response).to have_http_status(200)
      end

      it 'logins the user and set cookies' do
        expect(response.cookies[JWTSessions.access_cookie]).to be_present
        expect(response).to match_json_schema('csrf_token')
      end
    end

    context 'with invalid id' do
      let(:params) { { username: user.username.split('').shuffle.join, password: user.password } }

      it 'not_found', :dox do
        expect(response).to have_http_status(404)
      end

      it 'returns a validations message' do
        expect(response.cookies[JWTSessions.access_cookie]).not_to be_present
      end
    end

    context 'with invalid params' do
      let(:params) { { username: user.username, password: '' } }

      it 'unauthorized', :dox do
        expect(response).to have_http_status(401)
      end

      it 'returns a validations message' do
        expect(response.cookies[JWTSessions.access_cookie]).not_to be_present
      end
    end
  end
end
