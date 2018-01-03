desc 'Lazily fetch all feeds.'
task lazy_fetch: :environment do
  if ENV["APP_URL"]
    uri = URI(ENV["APP_URL"])
    Net::HTTP.get_response(uri)
  end

  FeedRepository.list.each do |feed|
    Delayed::Job.enqueue FetchFeedJob.new(feed.id)
  end
end
