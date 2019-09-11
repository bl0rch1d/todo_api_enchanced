module Docs
  module V1
    module Projects
      extend Dox::DSL::Syntax

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
        action 'Create a project'
      end

      document :update do
        action 'Update the project'
      end

      document :destroy do
        action 'Destroy project'
      end
    end
  end
end
