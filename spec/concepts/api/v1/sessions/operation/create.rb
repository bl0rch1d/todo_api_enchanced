module Api::V1
  module Sessions::Operation
    class Create < Trailblazer::Operation
      step :model!
      step :authenticate!
      step :login

      def model!(ctx, params:, **)
        ctx['model'] = User.find_by!(username: params[:username])
      end

      def authenticate!(ctx, params:, **)
        raise JWTSessions::Errors::Unauthorized unless ctx['model'].authenticate(params[:password])

        true
      end

      def login(ctx, **)
        ctx['tokens'] = Lib::Service::JwtSessionsService::Login.call(user_id: ctx['model'].id)
      end
    end
  end
end
