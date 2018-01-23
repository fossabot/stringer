# frozen_string_literal: true

class AddFeedsUserUrlIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :feeds, [:user_id, :url], unique: true
  end
end
