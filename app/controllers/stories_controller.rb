# frozen_string_literal: true

class StoriesController < ApplicationController
  def update
    json_params = JSON.parse(request.body.read, symbolize_names: true)

    story = StoryRepository.fetch(params[:id])
    story.is_read = !!json_params[:is_read]
    story.keep_unread = !!json_params[:keep_unread]
    story.starred = !!json_params[:starred]

    StoryRepository.save(story)

    head :no_content
  end
end
