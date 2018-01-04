# frozen_string_literal: true

class FeedController < ApplicationController
  def show
    @feed = FeedRepository.fetch(params[:id])

    @stories = StoryRepository.feed(params[:id])
    @unread_stories = @stories.find_all { |story| !story.is_read }
  end
end
