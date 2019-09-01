class User < ApplicationRecord
  USERNAME_LENGTH_RANGE = (3..50).freeze
  PASSWORD_RANGE = (8..128).freeze

  has_many :projects, dependent: :destroy

  has_secure_password
end
