# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    @unread_stories = current_user.unreaded_stories
                                  .order(published: :desc)
                                  .includes(:feed)
                                  .page(params[:page]).per(20)
  end
end
