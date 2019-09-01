module Api::V1
  module Sessions::Operation
    class Update < Trailblazer::Operation
      step :refresh

      def refresh(ctx, **)
        ctx['tokens'] = Lib::Service::JwtSessionsService::Refresh.call(ctx['payload'])
      end
    end
  end
end
