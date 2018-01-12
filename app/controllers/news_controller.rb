# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    @unread_stories = StoryRepository.unread(params[:page])
  end
end
