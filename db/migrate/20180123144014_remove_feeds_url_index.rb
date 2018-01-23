# frozen_string_literal: true

class RemoveFeedsUrlIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :feeds, column: :url, unique: true
  end
end
