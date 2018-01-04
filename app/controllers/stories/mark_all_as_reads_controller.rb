# frozen_string_literal: true

module Stories
  class MarkAllAsReadsController < ApplicationController
    def create
      ::MarkAllAsRead.new(params[:story_ids]).mark_as_read

      redirect_to news_index_path
    end
  end
end
