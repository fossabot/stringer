class StarredNewsController < ApplicationController
  def index
    @starred_stories = StoryRepository.starred(params[:page])
  end
end
