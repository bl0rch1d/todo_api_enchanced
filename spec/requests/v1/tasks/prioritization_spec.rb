RSpec.describe 'Task prioritization API', type: :request do
  include Docs::V1::Tasks::Api

  let(:user) { create(:user, :with_project_with_task) }

  let(:bearer) { { 'Authorization': "Bearer #{tokens[:access]}" } }
  let(:tokens) { JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login }

  let(:valid_task_id) { user.projects.first.tasks.sample }
  let(:invalid_task_id) { 888 }

  let(:valid_position_value) { rand(1..5) }

  describe 'PATCH tasks/:id/position' do
    include Docs::V1::Tasks::Position

    before { patch api_v1_task_prioritizations_path(task_id), headers: bearer, params: params }

    let(:task_id) { valid_task_id }
    let(:params) { { task: { position: valid_position_value } } }

    it 'success', :dox do
      expect(response).to have_http_status(200)
    end

    it 'updates position of a task' do
      expect(response).to match_json_schema('tasks/create_update_destroy')
    end

    context 'with invalid task_id' do
      let(:task_id) { invalid_task_id }

      it 'when not_found', :dox do
        expect(response).to have_http_status(404)
      end

      it { expect(response).to match_json_schema('not_found') }
    end
  end
end
