class FetchFeeds
  def initialize(feeds)
    @feeds = feeds
    @feeds_ids = []
  end

  def fetch_all
    @feeds = FeedRepository.fetch_by_ids(@feeds_ids) if @feeds.blank? && !@feeds_ids.blank?

    @feeds.each do |feed|
      FetchFeed.new(feed).fetch
    end
  end

  def prepare_to_delay
    @feeds_ids = @feeds.map(&:id)
    @feeds = []
    self
  end

  def self.enqueue(feeds)
    # new(feeds).prepare_to_delay.delay.fetch_all

    new(feeds).prepare_to_delay.fetch_all
  end
end
