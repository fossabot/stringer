module Feeds
  class ExportsController < ApplicationController
    def show
      send_data(ExportToOpml.new(Feed.all).to_xml,
                disposition: 'attachment',
                type: 'application/xml',
                filename: 'stringer.opml')
    end
  end
end