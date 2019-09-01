class Api::V1::Auth::RegistrationsController < Api::V1::ApiController
  def create
    user = User.new(user_params)

    user.save!

    @tokens = TokenSessionService.new(user: user).login

    setup_cookie_and_render(status: :created)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
