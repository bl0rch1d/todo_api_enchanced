class Api::V1::Auth::SessionsController < Api::V1::ApiController
  before_action :authorize_refresh_by_access_request!, only: :update
  before_action :authorize_access_request!, only: :destroy

  def create
    user = AuthenticationService.new(params).call

    @tokens = TokenSessionService.new(user: user).login

    setup_cookie_and_render
  end

  def update
    @tokens = TokenSessionService.new(payload: claimless_payload).refresh!

    setup_cookie_and_render
  end

  def destroy
    @tokens = TokenSessionService.new(payload: payload).destroy

    render json: :ok
  end
end
