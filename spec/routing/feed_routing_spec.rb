# frozen_string_literal: true

require 'rails_helper'

describe FeedController do
  describe 'routing' do
    it 'should route GET /feed/:id to feed#show' do
      expect(get: '/feed/123').to route_to(
        controller: 'feed',
        action: 'show',
        id: '123'
      )
    end
  end
end
