module Api::V1
  module Comments::Operation
    class Create < Trailblazer::Operation
      step :model
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step Contract::Build(constant: Comments::Contract::Create)
      step Contract::Validate(key: :comment), fail_fast: true
      step Contract::Persist()
      step :prepare_renderer

      def model(ctx, params:, **)
        ctx['model'] = Task.find(params[:task_id]).comments.new
      end

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Comments::Representer::CommentSerializer }
      end
    end
  end
end
