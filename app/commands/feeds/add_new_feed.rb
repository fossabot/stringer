# frozen_string_literal: true

class AddNewFeed
  def self.add(current_user, url, discoverer = FeedDiscovery.new)
    result = discoverer.discover(url)
    return false unless result

    current_user.feeds.create!(name: result.title,
                               url: result.feed_url,
                               last_fetched: 1.day.ago)
  end
end
