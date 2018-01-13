# frozen_string_literal: true

class AddUniqIndexUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, 'LOWER(email)', unique: true, name: 'index_users_on_LOWER_email'
  end
end
