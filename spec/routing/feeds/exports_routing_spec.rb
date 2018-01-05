# frozen_string_literal: true

require 'rails_helper'

describe Feeds::ExportsController do
  describe 'routing' do
    it 'should route GET /feeds/export to feeds/exports#show' do
      expect(get: '/feeds/export').to route_to(
        controller: 'feeds/exports',
        action: 'show'
      )
    end
  end
end
