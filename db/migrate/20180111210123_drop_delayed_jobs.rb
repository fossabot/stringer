# frozen_string_literal: true

class DropDelayedJobs < ActiveRecord::Migration[5.2]
  def change
    drop_table :delayed_jobs # rubocop:disable Rails/ReversibleMigration
  end
end
