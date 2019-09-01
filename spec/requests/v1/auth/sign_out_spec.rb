RSpec.describe 'Sign out API', type: :request do
  include Docs::V1::Sessions::Api

  let!(:user) { create(:user) }

  let(:bearer) { { 'Authorization': "Bearer #{tokens[:access]}" } }

  describe 'DELETE /auth/sessions' do
    include Docs::V1::Sessions::Destroy

    let(:tokens) do
      JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login
    end

    before { delete api_v1_auth_sessions_path, headers: bearer }

    it 'success', :dox do
      expect(response).to have_http_status(200)
    end

    context 'when not authorized' do
      before { delete api_v1_auth_sessions_path }

      it 'unathorized', :dox do
        expect(response).to have_http_status(401)
      end

      it { expect(response).to match_json_schema('unauthorized') }
    end
  end
end
