module Api::V1
  module Projects::Operation
    class Create < Trailblazer::Operation
      step :model
      step Contract::Build(constant: Projects::Contract::Create)
      step Contract::Validate(key: :project), fail_fast: true
      step Contract::Persist()
      step :prepare_renderer

      def model(ctx, **)
        ctx['model'] = ctx['current_user'].projects.new
      end

      def prepare_renderer(ctx, **)
        ctx['renderer_options'] = { class: Projects::Representer::ProjectSerializer }
      end
    end
  end
end
