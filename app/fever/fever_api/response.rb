# frozen_string_literal: true

module FeverAPI
  API_VERSION = 3

  class Response
    ACTIONS = [
      Authentication,

      ReadFeeds,
      ReadGroups,
      ReadFeedsGroups,
      ReadFavicons,
      ReadItems,
      ReadLinks,

      SyncUnreadItemIds,
      SyncSavedItemIds,

      WriteMarkItem,
      WriteMarkFeed,
      WriteMarkGroup
    ].freeze

    def initialize(params)
      @params = params
    end

    def to_json
      base_response = { api_version: API_VERSION }
      ACTIONS
        .inject(base_response) { |a, e| a.merge!(e.new.call(@params)) }
        .to_json
    end
  end
end
