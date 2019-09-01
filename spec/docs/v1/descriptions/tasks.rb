module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      EXAMPLE_ID = rand(1..99)
      EXAMPLE_NAME = FFaker::Lorem.words(2).join
      EXAMPLE_TASK_NAME = FFaker::Lorem.words(2).join
      EXAMPLE_DEADLINE = Time.zone.now + 1.week
      EXAMPLE_POSITION = rand(1..10)

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
        action 'Create a task' do
          params project_id: { type: :integer, required: :required, value: EXAMPLE_ID },
                 name: { type: :string, required: :required, value: EXAMPLE_NAME }
        end
      end

      document :update do
        action 'Update the task' do
          params id: { type: :integer, required: :required, value: EXAMPLE_ID },
                 name: { type: :string, required: :required, value: EXAMPLE_TASK_NAME },
                 deadline: { type: :datetime, required: :optional, value: EXAMPLE_DEADLINE }
        end
      end

      document :position do
        action 'Update postition of a task' do
          params task_id: { type: :integer, required: :required, value: EXAMPLE_ID },
                 position: { type: :integer, required: :required, value: EXAMPLE_POSITION }
        end
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
