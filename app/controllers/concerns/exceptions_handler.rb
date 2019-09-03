module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
    # rescue_from ActiveRecord::RecordNotFound, with: :not_found
    # rescue_from ActiveRecord::RecordNotDestroyed, with: :unprocessable_entity

    # def not_found(exception)
    #   render json: { errors: exception.message }, status: :not_found
    # end

    def not_authorized
      render json: { errors: I18n.t('jwt.unauthorized') }, status: :unauthorized
    end

    # def unprocessable_entity(exception)
    #   render json: { errors: exception.message }, status: :unprocessable_entity
    # end
  end
end
