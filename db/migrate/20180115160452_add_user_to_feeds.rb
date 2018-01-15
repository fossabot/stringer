# frozen_string_literal: true

class AddUserToFeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :feeds, :user_id, :bigint

    add_foreign_key :feeds, :users
  end
end
