module Api::V1
  module Tasks::Completion::Operation
    class Update < Trailblazer::Operation
      step :model, fail_fast: true
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step :swap_completed
      step :prepare_renderer

      def model(ctx, params:, **)
        ctx['model'] = Task.find_by(id: params[:task_id])
      end

      def swap_completed(ctx, **)
        ctx['model'].update!(completed: !ctx['model'].completed)
      end

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Tasks::Representer::TaskSerializer }
      end
    end
  end
end
