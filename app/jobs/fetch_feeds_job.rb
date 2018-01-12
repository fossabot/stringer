# frozen_string_literal: true

class FetchFeedsJob < ApplicationJob
  queue_as :default

  def perform
    Feed.find_each do |feed|
      FetchFeedJob.perform_later(feed)
    end
  end
end
