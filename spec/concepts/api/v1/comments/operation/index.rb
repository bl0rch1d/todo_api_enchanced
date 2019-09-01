module Api::V1
  module Comments::Operation
    class Index < Trailblazer::Operation
      step :model
      step :prepare_renderer

      def model(ctx, params:, **)
        ctx['model'] = Comment.joins(task: :project).where(tasks: { projects: { user: params['current_user'] } })
      end

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Comments::Representer::CommentSerializer }
      end
    end
  end
end
