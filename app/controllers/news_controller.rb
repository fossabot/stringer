class NewsController < ApplicationController
  def index
    @unread_stories = StoryRepository.unread
  end
end
