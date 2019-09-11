module Api::V1
  module Registrations::Contract
    class Create < Reform::Form
      property :username
      property :password
      property :password_confirmation

      validates :username, :password, presence: true

      validates :username, length: { within: User::USERNAME_LENGTH_RANGE }
      validates_uniqueness_of :username
      validates :password, length: { within: User::PASSWORD_RANGE }, confirmation: true
    end
  end
end
