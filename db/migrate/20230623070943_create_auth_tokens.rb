# frozen_string_literal: true

# Migration file to create auth_tokens table
class CreateAuthTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :auth_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token, null: false
      t.datetime :valid_until

      t.timestamps
    end
  end
end
