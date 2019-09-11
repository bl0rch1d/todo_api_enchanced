module Api::V1
  module Tasks::Operation
    class Create < Trailblazer::Operation
      step :model
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step Contract::Build(constant: Tasks::Contract::Create)
      step Contract::Validate(key: :task), fail_fast: true
      step Contract::Persist()
      step :prepare_renderer

      def model(ctx, params:, **)
        ctx['model'] = Project.find(params[:project_id]).tasks.new
      end

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Tasks::Representer::TaskSerializer }
      end
    end
  end
end
