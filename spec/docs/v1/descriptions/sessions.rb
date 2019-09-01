module Docs
  module V1
    module Sessions
      extend Dox::DSL::Syntax

      USERNAME_EXAMPLE = 'hooin_kёma'.freeze
      PASSWORD_EXAMPLE = 'elpsykongru'.freeze

      document :api do
        resource 'Sessions' do
          endpoint '/sessions'
          group 'Sessions'
        end
      end

      document :create do
        action 'Create session' do
          params username: { type: :string, required: :required, value: USERNAME_EXAMPLE },
                 password: { type: :string, required: :required, value: PASSWORD_EXAMPLE }
        end
      end

      document :update do
        action 'Update session'
      end

      document :destroy do
        action 'Destroy session'
      end
    end
  end
end
