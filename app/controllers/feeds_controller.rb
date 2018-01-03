class FeedsController < ApplicationController
  def index
    @feeds = FeedRepository.list
  end
end
