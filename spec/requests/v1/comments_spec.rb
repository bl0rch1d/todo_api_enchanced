RSpec.describe 'Comments API', type: :request do
  include Docs::V1::Comments::Api

  let(:user) { create(:user, :with_project_with_task_with_comments) }

  let(:bearer) { { 'Authorization': "Bearer #{tokens[:access]}" } }
  let(:tokens) { JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true).login }

  let(:valid_task_id) { user.projects.first.tasks.first }
  let(:invalid_task_id) { 999 }

  let(:valid_comment_id) { user.projects.first.tasks.first.comments.first }
  let(:invalid_comment_id) { 999 }

  let(:valid_comment_body) { FFaker::Lorem.words(10).join }
  let(:invalid_comment_body) { '123' }

  describe 'GET /comments' do
    include Docs::V1::Comments::Index

    before { get api_v1_task_comments_path(task_id), headers: bearer }

    let(:task_id) { valid_task_id }

    it 'success', :dox do
      expect(response).to have_http_status(200)
    end

    it 'returns a list of comments' do
      expect(response).to match_json_schema('comments')
    end
  end

  describe 'POST /comments' do
    include Docs::V1::Comments::Create

    before { post api_v1_task_comments_path(task_id), headers: bearer, params: params }

    context 'with valid params' do
      let(:task_id) { valid_task_id }
      let(:params) { { comment: { body: valid_comment_body } } }

      it 'success', :dox do
        expect(response).to have_http_status(201)
      end

      it 'returns the comment' do
        expect(response).to match_json_schema('comment')
      end

      context 'with image' do
        context 'with valid size and format' do
          let(:params) do
            {
              comment: {
                body: valid_comment_body,
                image: Rack::Test::UploadedFile.new('./spec/fixtures/valid_attachment.jpg', 'image/jpeg', true)
              }
            }
          end

          it 'success' do
            expect(response).to have_http_status(201)
          end

          it 'returns the comment' do
            expect(response).to match_json_schema('comment')
          end
        end

        context 'with invalid size and format' do
          let(:params) do
            {
              comment: {
                body: valid_comment_body,
                image: Rack::Test::UploadedFile.new('./spec/fixtures/invalid_attachment.pdf', 'application/pdf', true)
              }
            }
          end

          it 'unprocessable' do
            expect(response).to have_http_status(422)
          end

          it 'returns the comment' do
            expect(response).to match_json_schema('unprocessable')
          end
        end
      end
    end

    context 'with invalid params' do
      let(:task_id) { valid_task_id }
      let(:params) { { comment: { body: invalid_comment_body } } }

      it 'unprocessable', :dox do
        expect(response).to have_http_status(422)
      end

      it { expect(response).to match_json_schema('unprocessable') }
    end
  end

  describe 'DELETE /comments/:id' do
    include Docs::V1::Comments::Destroy

    before { delete api_v1_comment_path(comment_id), headers: bearer }

    let(:comment_id) { valid_comment_id }

    it 'success', :dox do
      expect(response).to have_http_status(204)
    end

    context 'when not found' do
      let(:comment_id) { invalid_comment_id }

      it 'not_found', :dox do
        expect(response).to have_http_status(404)
      end
    end
  end
end
