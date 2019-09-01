module Api::V1
  module Sessions::Operation
    class Destroy < Trailblazer::Operation
      step :destroy

      def destroy(ctx, **)
        ctx['tokens'] = Lib::Service::JwtSessionsService::Flush.call(ctx['payload'])
      end
    end
  end
end
