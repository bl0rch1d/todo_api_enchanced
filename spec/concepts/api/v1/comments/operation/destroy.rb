module Api::V1
  module Comments::Operation
    class Destroy < Trailblazer::Operation
      step Model(Comment, :find)
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step :destroy

      def destroy(ctx, **)
        ctx['model'].destroy!
      end
    end
  end
end
