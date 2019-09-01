class AuthenticationService
  def initialize(params)
    @params = params
  end

  def call
    find_user!

    authenticate!

    @user
  end

  private

  def find_user!
    @user = User.find_by!(username: @params[:username])
  end

  def authenticate!
    raise JWTSessions::Errors::Unauthorized unless @user.authenticate(@params[:password])
  end
end
