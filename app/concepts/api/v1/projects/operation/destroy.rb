module Api::V1
  module Projects::Operation
    class Destroy < Trailblazer::Operation
      step Model(Project, :find)
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step :destroy

      def destroy(ctx, **)
        ctx['model'].destroy!
      end
    end
  end
end
