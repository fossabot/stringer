# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    @unread_stories = current_user.stories
                                  .where(is_read: false)
                                  .order(published: :desc)
                                  .includes(:feed)
                                  .page(params[:page]).per(20)
  end
end
