# frozen_string_literal: true

require 'rails_helper'

describe Feeds::ImportsController do
  describe 'routing' do
    it 'should route GET /feeds/import to feeds/imports#show' do
      expect(get: '/feeds/import').to route_to(
        controller: 'feeds/imports',
        action: 'show'
      )
    end

    it 'should route POST /feeds/import to feeds/imports#create' do
      expect(post: '/feeds/import').to route_to(
        controller: 'feeds/imports',
        action: 'create'
      )
    end
  end
end
