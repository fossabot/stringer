# frozen_string_literal: true

class Rename < ActiveRecord::Migration[5.2]
  def change
    rename_column :stories, :is_starred, :starred
  end
end
