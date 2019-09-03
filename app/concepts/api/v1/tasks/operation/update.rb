module Api::V1
  module Tasks::Operation
    class Update < Trailblazer::Operation
      step Model(Task, :find_by)
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step Contract::Build(constant: Tasks::Contract::Update)
      step Contract::Validate(key: :task), fail_fast: true
      step Contract::Persist()
      step :prepare_renderer

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Tasks::Representer::TaskSerializer }
      end
    end
  end
end
