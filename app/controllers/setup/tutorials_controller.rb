# frozen_string_literal: true

module Setup
  class TutorialsController < ApplicationController
    def show
      FetchFeeds.enqueue(Feed.all)
      CompleteSetup.complete(current_user)

      @sample_stories = StoryRepository.samples
    end
  end
end
