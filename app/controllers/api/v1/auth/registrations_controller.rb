class Api::V1::Auth::RegistrationsController < Api::V1::ApiController
  def create
    endpoint Api::V1::Registrations::Operation::Create
  end
end
