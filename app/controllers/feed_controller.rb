# frozen_string_literal: true

class FeedController < ApplicationController
  def show
    @feed = current_user.feeds.find(params[:id])

    @stories = @feed.stories.order(published: :desc).includes(:feed)

    @unread_stories = @stories.where(readed: false)
  end
end
