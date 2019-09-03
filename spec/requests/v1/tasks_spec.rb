RSpec.describe 'Tasks API', type: :request do
  include Docs::V1::Tasks::Api

  let(:user) { create(:user, :with_project_with_task) }

  let(:bearer) { { 'Authorization': "Bearer #{tokens[:access]}" } }
  let(:tokens) { JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login }

  let(:valid_project_id) { user.projects.first }
  let(:valid_task_id) { user.projects.first.tasks.first }

  let(:invalid_task_id) { 888 }

  let(:valid_task_name) { FFaker::Lorem.words(2).join }
  let(:invalid_task_name) { nil }

  let(:valid_deadline) { Time.zone.today + 1.week }
  let(:invalid_deadline) { Time.zone.today - 1.week }

  describe 'GET /tasks' do
    include Docs::V1::Tasks::Index

    before { get api_v1_project_tasks_path(project_id), headers: bearer }

    let(:project_id) { valid_project_id }

    it 'success', :dox do
      expect(response).to have_http_status(200)
    end

    it 'returns a list of tasks' do
      expect(response).to match_json_schema('tasks')
    end
  end

  describe 'GET /tasks/:id' do
    include Docs::V1::Tasks::Show

    before { get api_v1_task_path(task_id), headers: bearer }

    context 'when success' do
      let(:task_id) { valid_task_id }

      it 'success', :dox do
        expect(response).to have_http_status(200)
      end

      it 'returns a task' do
        expect(response).to match_json_schema('task')
      end
    end

    context 'when not_found' do
      let(:task_id) { invalid_task_id }

      it 'not_found', :dox do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /tasks' do
    include Docs::V1::Tasks::Create

    before { post api_v1_project_tasks_path(project_id), headers: bearer, params: params }

    context 'with valid name' do
      let(:project_id) { valid_project_id }
      let(:params) { { task: { name: valid_task_name } } }

      it 'success', :dox do
        expect(response).to have_http_status(201)
      end

      it 'returns the task' do
        expect(response).to match_json_schema('task')
      end
    end

    context 'with invalid name' do
      let(:project_id) { valid_project_id }
      let(:params) { { task: { name: invalid_task_name } } }

      it 'unprocessable', :dox do
        expect(response).to have_http_status(422)
      end

      it { expect(response).to match_json_schema('unprocessable') }
    end
  end

  describe 'PATCH /tasks/:id' do
    include Docs::V1::Tasks::Update

    before { patch api_v1_task_path(task_id), headers: bearer, params: params }

    let(:task_id) { valid_task_id }

    context 'with valid params' do
      context 'when name' do
        let(:params) { { task: { name: valid_task_name } } }

        it 'success', :dox do
          expect(response).to have_http_status(200)
        end

        it { expect(response).to match_json_schema('task') }
      end

      context 'when deadline' do
        let(:params) { { task: { deadline: valid_deadline } } }

        it 'success', :dox do
          expect(response).to have_http_status(200)
        end

        it { expect(response).to match_json_schema('task') }
      end
    end

    context 'with invalid params' do
      context 'when name' do
        let(:params) { { task: { name: invalid_task_name } } }

        it 'unprocessable', :dox do
          expect(response).to have_http_status(422)
        end

        it { expect(response).to match_json_schema('task') }
      end

      context 'when deadline' do
        let(:params) { { task: { deadline: invalid_deadline } } }

        it 'unprocessable', :dox do
          expect(response).to have_http_status(422)
        end

        it { expect(response).to match_json_schema('unprocessable') }
      end
    end

    context 'when invalid task_id' do
      let(:task_id) { invalid_task_id }
      let(:params) { { task: { name: valid_task_name, deadline: valid_deadline } } }

      it 'when not_found', :dox do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'DELETE /tasks/:id' do
    include Docs::V1::Tasks::Destroy

    before { delete api_v1_task_path(task_id), headers: bearer }

    context 'with valid task_id' do
      let(:task_id) { valid_task_id }

      it 'when success', :dox do
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid task_id' do
      let(:task_id) { invalid_task_id }

      it 'when not_found', :dox do
        expect(response).to have_http_status(404)
      end
    end
  end
end
