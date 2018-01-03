desc 'Fetch all feeds.'
task fetch_feeds: :environment do
  FetchFeeds.new(Feed.all).fetch_all
end
