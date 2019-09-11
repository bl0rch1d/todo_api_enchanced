module Api::V1
  module Sessions::Operation
    class Create < Trailblazer::Operation
      step :model, fail_fast: true
      step :authenticate, fail_fast: true
      step :login

      def model(ctx, params:, **)
        ctx['model'] = User.find_by(username: params[:username])
      end

      def authenticate(ctx, params:, **)
        ctx['authenticated'] = ctx['model'].authenticate(params[:password])
      end

      def login(ctx, **)
        ctx['tokens'] = Lib::Service::JwtSessionsService::Login.call(user_id: ctx['model'].id)
      end
    end
  end
end
