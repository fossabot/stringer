require_relative "../repositories/story_repository"
require_relative "../commands/stories/mark_all_as_read"

class Stringer < Sinatra::Base
  get "/feed/:feed_id" do
    @feed = FeedRepository.fetch(params[:feed_id])

    @stories = StoryRepository.feed(params[:feed_id])
    @unread_stories = @stories.find_all { |story| !story.is_read }

    erb :feed
  end

  post "/stories/mark_all_as_read" do
    MarkAllAsRead.new(params[:story_ids]).mark_as_read

    redirect to("/news")
  end
end
