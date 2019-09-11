module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint '/tasks'
          group 'Tasks'
        end
      end

      document :index do
        action 'Get all tasks'
      end

      document :show do
        action 'Show task'
      end

      document :create do
        action 'Create a task'
      end

      document :update do
        action 'Update the task'
      end

      document :position do
        action 'Update postition of a task'
      end

      document :completed do
        action 'Update state of a task'
      end

      document :destroy do
        action 'Destroy task'
      end
    end
  end
end
