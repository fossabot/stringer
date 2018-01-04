# frozen_string_literal: true

module Feeds
  class ImportsController < ApplicationController
    def show
    end

    def create
      ::ImportFromOpml.import(params[:opml_file])

      redirect_to setup_tutorial_path
    end
  end
end
