# frozen_string_literal: true

class MarkFeedAsRead
  def initialize(feed_id, timestamp, repository = StoryRepository)
    @feed_id   = feed_id.to_i
    @repo      = repository
    @timestamp = timestamp
  end

  def mark_feed_as_read
    @repo.fetch_unread_for_feed_by_timestamp(@feed_id, @timestamp).update_all(readed: true)
  end
end
