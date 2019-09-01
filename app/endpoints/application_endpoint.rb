class ApplicationEndpoint
  Matcher = Dry::Matcher.new(
    success: Dry::Matcher::Case.new(
      match: ->(result) { result.success? },
      resolve: ->(result) { result }
    ),

    created: Dry::Matcher::Case.new(
      match: ->(result) { result.success? && result['model.action'] == :new },
      resolve: ->(result) { result }
    ),

    unprocessable: Dry::Matcher::Case.new(
      match: ->(result) { result.failiure? && result['contract.default']&.errors },
      resolve: ->(result) { result }
    ),

    destroyed: Dry::Matcher::Case.new(
      match: ->(result) { result.success? && result['model'].try(:destroyed?) },
      resolve: ->(result) { result }
    ),

    no_content: Dry::Matcher::Case.new(
      match: ->(result) { result.success? && ressult['renderer_options'].nil? },
      resolve: ->(result) { result }
    )
  )

  def self.call(operation_class, handlers, *args)
    result = operation_class.call(*args)

    matcher.call(result, handlers)
  end

  private

  def matcher
    ApplicationEndpoint::Matcher
  end
end
