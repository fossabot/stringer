# frozen_string_literal: true

class ArchivedNewsController < ApplicationController
  def index
    @read_stories = current_user.readed_stories
                                .includes(:feed)
                                .order(published: :desc)
                                .page(params[:page]).per(20)
  end
end
