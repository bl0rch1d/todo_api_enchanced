module Api::V1
  module Comments::Operation
    class Create < Trailblazer::Operation
      step :model
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step Contract::Build(constant: Tasks::Contract::Create)
      step :validate, fail_fast: true
      step Contract::Persist()
      step :prepare_renderer

      def model(ctx, params:, **)
        ctx['model'] = Task.find_by(id: params[:task_id])
      end

      def validate(ctx, params:, **)
        ctx['contract.default'].validate(comments: [params[:comment]])
      end

      def prepare_renderer(ctx, **)
        ctx['model'] = ctx['model'].comments.last
        ctx['renderer_options'] = { class: Comments::Representer::CommentSerializer }
      end
    end
  end
end
