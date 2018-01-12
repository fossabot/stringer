# frozen_string_literal: true

module Setup
  class TutorialsController < ApplicationController
    def show
      FetchFeedsJob.perform_later

      CompleteSetup.complete(current_user)

      @sample_stories = StoryRepository.samples
    end
  end
end
