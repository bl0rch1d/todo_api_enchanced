module Api::V1
  module Projects::Operation
    class Index < Trailblazer::Operation
      step :model
      step :prepare_renderer

      def model(ctx, **)
        ctx['model'] = ctx['current_user'].projects
      end

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Projects::Representer::ProjectSerializer }
      end
    end
  end
end
