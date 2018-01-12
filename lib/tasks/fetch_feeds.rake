# frozen_string_literal: true

desc 'Fetch all feeds'
task fetch_feeds: :environment do
  FetchFeedsJob.perform_later
end
