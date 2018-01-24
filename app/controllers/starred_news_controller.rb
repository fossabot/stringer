# frozen_string_literal: true

class StarredNewsController < ApplicationController
  def index
    @starred_stories = current_user.stories
                                   .where(is_starred: true)
                                   .includes(:feed)
                                   .order(published: :desc)
                                   .page(params[:page]).per(20)
  end
end
