class Api::V1::Auth::SessionsController < Api::V1::ApiController
  before_action :authorize_refresh_by_access_request!, only: :update
  before_action :authorize_access_request!, only: :destroy

  def create
    endpoint Api::V1::Sessions::Operation::Create
  end

  def update
    endpoint Api::V1::Sessions::Operation::Update, payload: claimless_payload
  end

  def destroy
    endpoint Api::V1::Sessions::Operation::Destroy, payload: payload
  end
end
