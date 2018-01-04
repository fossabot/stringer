# frozen_string_literal: true

class FeedRepository
  MIN_YEAR = 1970

  def self.fetch(id)
    Feed.find(id)
  end

  def self.fetch_by_ids(ids)
    Feed.where(id: ids)
  end

  def self.update_feed(feed, name, url, group_id = nil)
    feed.name = name
    feed.url = url
    feed.group_id = group_id
    feed.save
  end

  def self.update_last_fetched(feed, timestamp)
    if valid_timestamp?(timestamp, feed.last_fetched)
      feed.last_fetched = timestamp
      feed.save
    end
  end

  def self.delete(feed_id)
    Feed.destroy(feed_id)
  end

  def self.set_status(status, feed)
    feed.status = status
    feed.save
  end

  def self.list
    Feed.order("lower(name)")
  end

  def self.in_group
    Feed.where("group_id IS NOT NULL")
  end

  def self.valid_timestamp?(new_timestamp, current_timestamp)
    new_timestamp && new_timestamp.year >= MIN_YEAR &&
      (current_timestamp.nil? || new_timestamp > current_timestamp)
  end
end
