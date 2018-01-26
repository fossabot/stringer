# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    @unread_stories = current_user.stories
                                  .where(readed: false)
                                  .order(published: :desc)
                                  .includes(:feed)
                                  .page(params[:page]).per(20)
  end
end
