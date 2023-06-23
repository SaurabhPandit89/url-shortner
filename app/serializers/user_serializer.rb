# frozen_string_literal: true

# User Serializer
class UserSerializer < ActiveModel::Serializer
  attributes :token, :valid_until
end
