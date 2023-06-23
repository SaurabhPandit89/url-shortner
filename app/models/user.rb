# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_secure_password

  has_one :auth_token
  has_many :urls

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

  after_create :generate_auth_token

  def token
    auth_token.token
  end

  def valid_until
    auth_token.valid_until
  end

  private

  def generate_auth_token
    build_auth_token(token: SecureRandom.hex(32), valid_until: Time.now + 1.day)
    save
  end
end
