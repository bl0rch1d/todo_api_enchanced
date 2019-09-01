module DefaultEndpoint
  protected

  # rubocop:disable Metrics/AbcSize
  def default_handler
    lambda do |match|
      match.created { |result| result['renderer_options'] ? render_response(result, :created) : render_tokens(result) }
      match.destroyed { head(:no_content) }
      match.forbidden { head(:forbidden) }
      match.unprocessable { |result| render_errors(result) }
      match.no_content { head(:no_content) }
      match.success { |result| result['tokens'].nil? ? render_response(result) : render_tokens(result) }
    end
  end
  # rubocop:enable Metrics/AbcSize

  def endpoint(operation_class, options = {}, &block)
    ApplicationEndpoint.call(operation_class, default_handler, **options, params: params.to_unsafe_hash, &block)
  end

  private

  def render_response(result, status = :ok)
    render json: result['renderer_options'][:class].new(result['model']), status: status
  end

  def render_errors(result, status = :unprocessable_entity)
    render json: { errors: result['contract.default'].errors }.to_json, status: status
  end

  def render_tokens(result)
    status = result['model']&.previous_changes&.dig(:id) ? :created : :ok
    tokens = result['tokens']

    response.set_cookie(
      JWTSessions.access_cookie, value: tokens[:access], httponly: true, secure: Rails.env.production?
    )

    render json: { csrf: tokens[:csrf] }, status: status
  end
end
