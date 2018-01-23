# frozen_string_literal: true

class FeedsController < ApplicationController
  def index
    @feeds = FeedRepository.list
  end

  def new
    @feed_url = params[:feed_url]
  end

  def create
    @feed_url = params[:feed_url]
    feed = AddNewFeed.add(current_user, @feed_url)

    if feed && feed.valid?
      FetchFeedJob.perform_later(feed)

      flash[:success] = t('feeds.add.flash.added_successfully')

      redirect_to root_path
    elsif feed
      flash[:error] = t('feeds.add.flash.already_subscribed_error')

      render :new
    else
      flash[:error] = t('feeds.add.flash.feed_not_found_error')

      render :new
    end
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
