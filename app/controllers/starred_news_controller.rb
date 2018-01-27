# frozen_string_literal: true

class StarredNewsController < ApplicationController
  def index
    @starred_stories = current_user.starred_stories
                                   .includes(:feed)
                                   .order(published: :desc)
                                   .page(params[:page])
  end
end
