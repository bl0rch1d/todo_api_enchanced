RSpec.describe 'Task completion API', type: :request do
  include Docs::V1::Tasks::Api

  let(:user) { create(:user, :with_project_with_task) }

  let(:bearer) { { 'Authorization': "Bearer #{tokens[:access]}" } }
  let(:tokens) { JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login }

  let(:valid_task_id) { user.projects.first.tasks.sample }
  let(:invalid_task_id) { 888 }

  describe 'PATCH tasks/:id/completed' do
    include Docs::V1::Tasks::Completed

    before { patch api_v1_task_completions_path(task_id), headers: bearer }

    let(:task_id) { valid_task_id }

    it 'success', :dox do
      expect(response).to have_http_status(200)
    end

    it 'completes the task' do
      expect(response).to match_json_schema('tasks/create_update_destroy')
    end

    context 'with invalid task_id' do
      let(:task_id) { invalid_task_id }

      it 'when not_found', :dox do
        expect(response).to have_http_status(404)
      end
    end
  end
end
