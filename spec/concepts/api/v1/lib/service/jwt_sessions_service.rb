module Api::V1
  module Lib::Service::JwtSessionsService
    class Login
      def self.call(user_id)
        JWTSessions::Session.new(payload: { user_id: user_id }, refresh_by_access_allowed: true).login
      end
    end

    class Refresh
      def self.call(payload)
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)

        session.refresh_by_access_payload { raise JWTSessions::Errors::Unauthorized }
      end
    end

    class Flush
      def self.call(payload)
        JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true).flush_by_access_payload
      end
    end
  end
end
