# frozen_string_literal: true

# Migration file to create urls table
class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.references :user, null: false, foreign_key: true
      t.string :actual
      t.string :short
      t.datetime :valid_until

      t.timestamps
    end
  end
end
