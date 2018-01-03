desc 'Fetch single feed'
task :fetch_feed, :id do |_t, args| # TODO: task fetch_feed: :environment do
  FetchFeed.new(Feed.find(args[:id])).fetch
end
