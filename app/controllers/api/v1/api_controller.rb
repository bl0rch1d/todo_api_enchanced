class Api::V1::ApiController < ApplicationController
  include JWTSessions::RailsAuthorization
  include Concerns::ExceptionsHandler
  include Pundit

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  def setup_cookie_and_render(status: :ok)
    response.set_cookie(JWTSessions.access_cookie,
                        value: @tokens[:access],
                        httponly: true,
                        secure: Rails.env.production?)

    render json: { csrf: @tokens[:csrf] }, status: status
  end
end
