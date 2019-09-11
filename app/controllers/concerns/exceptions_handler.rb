module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

    def not_authorized
      render json: { errors: I18n.t('jwt.unauthorized') }, status: :unauthorized
    end
  end
end
