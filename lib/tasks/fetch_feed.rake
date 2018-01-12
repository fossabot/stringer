desc 'Fetch single feed'
task :fetch_feed, :id do |_t, args| # TODO: task fetch_feed: :environment do
  FetchFeedJob.perform_later(Feed.find(args[:id]))
end
