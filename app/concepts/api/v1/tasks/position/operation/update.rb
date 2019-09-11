module Api::V1
  module Tasks::Position::Operation
    class Update < Trailblazer::Operation
      step :model, fail_fast: true
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step Contract::Build(constant: Tasks::Position::Contract::Update)
      step Contract::Validate(key: :task), fail_fast: true
      step Contract::Persist()
      step :prepare_renderer

      def model(ctx, params:, **)
        ctx['model'] = Task.find_by(id: params[:task_id])
      end

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Tasks::Representer::TaskSerializer }
      end
    end
  end
end
