# frozen_string_literal: true

# Url Serializer
class UrlSerializer < ActiveModel::Serializer
  attributes :short_url, :valid_until
end
