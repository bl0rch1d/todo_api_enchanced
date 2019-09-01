class ApplicationEndpoint
  Matcher = Dry::Matcher.new(
    created: Dry::Matcher::Case.new(
      match: ->(result) { result.success? && result['params']['action'] == 'create' },
      resolve: ->(result) { result }
    ),

    destroyed: Dry::Matcher::Case.new(
      match: ->(result) { result.success? && result['model'].try(:destroyed?) },
      resolve: ->(result) { result }
    ),

    forbidden: Dry::Matcher::Case.new(
      match: ->(result) { result.failure? && result['result.policy.default']&.failure? },
      resolve: ->(result) { result }
    ),

    unprocessable: Dry::Matcher::Case.new(
      match: ->(result) { result.failure? && result['contract.default']&.errors },
      resolve: ->(result) { result }
    ),

    no_content: Dry::Matcher::Case.new(
      match: ->(result) { result.success? && result['renderer_options'].nil? && result['tokens'].nil? },
      resolve: ->(result) { result }
    ),

    success: Dry::Matcher::Case.new(
      match: ->(result) { result.success? },
      resolve: ->(result) { result }
    )
  )

  def self.call(operation_class, handlers, *args, &block)
    result = operation_class.call(*args)
    new.call(result, handlers, &block)
  end

  # rubocop:disable Style/AndOr
  def call(result, handlers, &block)
    matcher.call(result, &block) and return if block_given?
    matcher.call(result, &handlers)
  end
  # rubocop:enable Style/AndOr

  def matcher
    ApplicationEndpoint::Matcher
  end
end
