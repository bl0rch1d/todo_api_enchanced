RSpec.describe 'Projects API', type: :request do
  include Docs::V1::Projects::Api

  let(:user) { create(:user, :with_projects) }

  let(:bearer) { { 'Authorization': "Bearer #{tokens[:access]}" } }
  let(:tokens) { JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login }

  let(:valid_project_id) { user.projects.first }
  let(:invalid_project_id) { 999 }

  let(:valid_name) { FFaker::Lorem.words(2).join }
  let(:invalid_name) { nil }

  describe 'GET /projects' do
    include Docs::V1::Projects::Index

    before { get api_v1_projects_path, headers: bearer }

    it 'success', :dox do
      expect(response).to have_http_status(200)
    end

    it 'returns a list of projects' do
      expect(response).to match_response_schema('projects')
    end
  end

  describe 'GET /projects/:id' do
    include Docs::V1::Projects::Show

    before { get api_v1_project_path(project), headers: bearer }

    let(:project) { valid_project_id }

    it 'success', :dox do
      expect(response).to have_http_status(200)
    end

    it 'return a project' do
      expect(response).to match_json_schema('project')
    end

    context 'when project not found' do
      let(:project) { invalid_project_id }

      it 'not_found', :dox do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /projects' do
    include Docs::V1::Projects::Create

    before { post api_v1_projects_path, headers: bearer, params: params }

    let(:params) { { project: { name: valid_name } } }

    it 'created', :dox do
      expect(response).to have_http_status(201)
    end

    it 'returns the project' do
      expect(response).to match_json_schema('project')
    end

    context 'when validation failed' do
      let(:params) { { project: { name: invalid_name } } }

      it 'unprocessable', :dox do
        expect(response).to have_http_status(422)
      end

      it 'returns validation errors' do
        expect(response).to match_json_schema('unprocessable')
      end
    end

    context 'when bad request' do
      let(:params) { { name: valid_name } }

      it 'bad_request', :dox do
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'PATCH /projects/:id' do
    include Docs::V1::Projects::Update

    before { patch api_v1_project_path(project_id), headers: bearer, params: params }

    let(:project_id) { valid_project_id }
    let(:params) { { project: { name: valid_name } } }

    it 'success', :dox do
      expect(response).to have_http_status(200)
    end

    it 'returns the project' do
      expect(response).to match_json_schema('project')
    end

    context 'when validation failed' do
      let(:params) { { project: { name: invalid_name } } }

      it 'unprocessable', :dox do
        expect(response).to have_http_status(422)
      end

      it 'returns validation errors' do
        expect(response).to match_json_schema('unprocessable')
      end
    end
  end

  describe 'DELETE /projects/:id' do
    include Docs::V1::Projects::Destroy

    before { delete api_v1_project_path(project), headers: bearer }

    let(:project) { valid_project_id }

    it 'success', :dox do
      expect(response).to have_http_status(204)
    end

    context 'when not_found' do
      let(:project) { invalid_project_id }

      it 'not_found', :dox do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'Forbidden' do
    before { delete api_v1_project_path(project), headers: bearer }

    let(:project) { create(:project).id }

    it 'success', :dox do
      expect(response).to have_http_status(403)
    end
  end
end
