class FeedsController < ApplicationController
  def index
    @feeds = FeedRepository.list
  end

  def edit
    @feed = FeedRepository.fetch(params[:id])
  end

  def update
    feed = FeedRepository.fetch(params[:id])

    FeedRepository.update_feed(feed, params[:feed_name], params[:feed_url], params[:group_id])

    flash[:success] = t('feeds.edit.flash.updated_successfully')

    redirect_to feeds_path
  end

  def destroy
    FeedRepository.delete(params[:id])

    head :no_content
  end
end
