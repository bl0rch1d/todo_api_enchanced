class Api::V1::ApiController < ApplicationController
  include JWTSessions::RailsAuthorization

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
end
