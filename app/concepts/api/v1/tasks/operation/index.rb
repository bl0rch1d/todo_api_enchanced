module Api::V1
  module Tasks::Operation
    class Index < Trailblazer::Operation
      step :model
      step :prepare_renderer

      def model(ctx, **)
        ctx['model'] = Task.joins(:project).where(projects: { user: ctx[:current_user] })
      end

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Tasks::Representer::TaskSerializer }
      end
    end
  end
end
