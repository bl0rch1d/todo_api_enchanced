module Api::V1
  module Tasks::Operation
    class Destroy < Trailblazer::Operation
      step Model(Task, :find)
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step :destroy

      def destroy(ctx, **)
        ctx['model'].destroy!
      end
    end
  end
end
