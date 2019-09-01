module Docs
  module V1
    module Projects
      extend Dox::DSL::Syntax

      EXAMPLE_ID = rand(1..99)
      EXAMPLE_NAME = FFaker::Lorem.words(2).join
      EXAMPLE_PROJECT_NAME = FFaker::Lorem.words(2).join

      document :api do
        resource 'Projects' do
          endpoint '/projects'
          group 'Projects'
        end
      end

      document :index do
        action 'Get all projects'
      end

      document :show do
        action 'Show project' do
        end
      end

      document :create do
        action 'Create a project' do
          params name: { type: :string, required: :required, value: EXAMPLE_NAME }
        end
      end

      document :update do
        action 'Update the project' do
          params id: { type: :integer, required: :required, value: EXAMPLE_ID },
                 name: { type: :string, required: :required, value: EXAMPLE_PROJECT_NAME }
        end
      end

      document :destroy do
        action 'Destroy project'
      end
    end
  end
end
