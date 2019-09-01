module Api::V1
  module Registrations::Operation
    class Create < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: Registrations::Contract::Create)
      step Contract::Validate(key: :user), fail_fast: true
      step Contract::Persist()
      step :login

      def login(ctx, **)
        ctx['tokens'] = Lib::Service::JwtSessionsService::Login.call(user_id: ctx['model'].id)
      end
    end
  end
end
