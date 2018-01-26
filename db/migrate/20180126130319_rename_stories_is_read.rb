# frozen_string_literal: true

class RenameStoriesIsRead < ActiveRecord::Migration[5.2]
  def change
    rename_column :stories, :is_read, :readed
  end
end
