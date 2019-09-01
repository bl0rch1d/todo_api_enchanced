class TokenSessionService
  attr_reader :session

  def initialize(user: nil, payload: nil)
    @payload = payload || { user_id: user.id }

    @session = JWTSessions::Session.new(payload: @payload, refresh_by_access_allowed: true)
  end

  def login
    @session.login
  end

  def refresh!
    @session.refresh_by_access_payload { raise JWTSessions::Errors::Unauthorized }
  end

  def destroy
    @session.flush_by_access_payload
  end
end
