RSpec.describe 'Refresh token API', type: :request do
  include Docs::V1::Sessions::Api

  let!(:user) { create(:user) }

  let(:bearer) { { 'Authorization': "Bearer #{tokens[:access]}" } }

  describe 'PUT /auth/sessions' do
    include Docs::V1::Sessions::Update

    before { put api_v1_auth_sessions_path, headers: bearer }

    context 'when token expired' do
      let(:tokens) do
        JWTSessions.access_exp_time = 0
        JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login
      end

      it 'success', :dox do
        expect(response).to have_http_status(200)
      end

      it 'refreshes session' do
        expect(response.cookies[JWTSessions.access_cookie]).to be_present
        expect(response).to match_json_schema('csrf_token')
      end
    end

    context 'when token not expired' do
      let(:tokens) do
        JWTSessions.access_exp_time = 10
        JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login
      end

      it 'unauthorized', :dox do
        expect(response).to have_http_status(401)
      end

      it { expect(response).to match_json_schema('unauthorized') }
    end
  end
end
