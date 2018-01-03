class ArchivedNewsController < ApplicationController
  def index
    @read_stories = StoryRepository.read(params[:page])
  end
end
