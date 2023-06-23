# frozen_string_literal: true

# Url model
class Url < ApplicationRecord
  attr_accessor :auth_token

  DOMAIN = 'http://localhost:3000'

  belongs_to :user

  validates_presence_of :actual, :short, :valid_until

  scope :all_valid_user_urls, lambda { |token|
    where(user_id: AuthToken.find_user_id_by_token(token))
      .where('valid_until > ?', Time.now)
  }

  before_validation :set_values

  def set_values
    self.user_id = AuthToken.find_user_id_by_token(auth_token)
    self.short = SecureRandom.alphanumeric(10)
    self.valid_until = Time.now + 7.days
  end

  def short_url
    "#{DOMAIN}/#{short}"
  end

  def valid_url?
    valid_until > Time.now
  end
end
