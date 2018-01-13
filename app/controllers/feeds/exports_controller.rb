# frozen_string_literal: true

module Feeds
  class ExportsController < ApplicationController
    def show
      send_data(ExportToOpml.new(Feed.select(:name, :url)).to_xml,
                disposition: 'attachment',
                type: 'application/xml',
                filename: 'stringer.opml')
    end
  end
end
