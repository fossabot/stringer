# frozen_string_literal: true

class FetchFeedJob < ApplicationJob
  queue_as :default

  def perform(feed)
    FetchFeed.new(feed).fetch
  end
end
