class User < ApplicationRecord
  USERNAME_LENGTH_RANGE = (3..50).freeze
  PASSWORD_RANGE = (8..128).freeze

  has_many :projects, dependent: :destroy

  has_secure_password

  validates :username, :password, presence: true

  validates :username, length: { within: USERNAME_LENGTH_RANGE }, uniqueness: true
  validates :password, length: { within: PASSWORD_RANGE }, confirmation: true
end
