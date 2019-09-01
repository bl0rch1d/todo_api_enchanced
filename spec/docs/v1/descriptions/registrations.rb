module Docs
  module V1
    module Registrations
      extend Dox::DSL::Syntax

      USERNAME_EXAMPLE = 'hooin_kёma'.freeze
      PASSWORD_EXAMPLE = 'elpsykongru'.freeze

      document :api do
        resource 'Registrations' do
          endpoint '/registrations'
          group 'Registrations'
        end
      end

      document :create do
        action 'Create user' do
          params username: { type: :string, required: :required, value: USERNAME_EXAMPLE },
                 password: { type: :string, required: :required, value: PASSWORD_EXAMPLE },
                 password_confirmation: { type: :string, required: :required, value: PASSWORD_EXAMPLE }
        end
      end
    end
  end
end
