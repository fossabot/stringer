desc 'Fetch all feeds.'
task fetch_feeds: :environment do
  FetchFeedsJob.perform_later
end
