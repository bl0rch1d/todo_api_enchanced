module Api::V1
  module Projects::Operation
    class Update < Trailblazer::Operation
      step Model(Project, :find_by)
      step Policy::Guard(Lib::Policy::UserGuard.new), fail_fast: true
      step Contract::Build(constant: Projects::Contract::Create)
      step Contract::Validate(key: :project), fail_fast: true
      step Contract::Persist()
      step :prepare_renderer

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Projects::Representer::ProjectSerializer }
      end
    end
  end
end
