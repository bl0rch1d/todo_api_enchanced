module Docs
  module V1
    module Comments
      extend Dox::DSL::Syntax

      EXAMPLE_ID = rand(1..99)
      EXAMPLE_BODY = FFaker::Lorem.words(5).join

      document :api do
        resource 'Comments' do
          endpoint '/comments'
          group 'Comments'
        end
      end

      document :index do
        action 'Get all comments'
      end

      document :create do
        action 'Create a comment' do
          params task_id: { type: :integer, required: :required, value: EXAMPLE_ID },
                 body: { type: :string, required: :required, value: EXAMPLE_BODY },
                 image: { type: :image, required: :optional, value: ActionDispatch::Http::UploadedFile }
        end
      end

      document :destroy do
        action 'Destroy the comment' do
          params id: { type: :integer, required: :required, value: EXAMPLE_ID }
        end
      end
    end
  end
end
