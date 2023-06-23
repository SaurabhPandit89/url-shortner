# frozen_string_literal: true

# Auth Token model
class AuthToken < ApplicationRecord
  belongs_to :user

  validates :token, presence: true,
                    uniqueness: true
  validates :valid_until, presence: true

  scope :find_user_id_by_token, lambda { |auth_token|
    select(:user_id).find_by_token(auth_token).user_id
  }

  class << self
    def valid?(token)
      auth_token = find_by_token(token)
      return false unless auth_token

      auth_token.valid_token?
    end
  end

  def valid_token?
    valid_until > Time.now
  end
end
