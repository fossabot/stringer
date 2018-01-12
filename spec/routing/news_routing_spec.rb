# frozen_string_literal: true

require 'rails_helper'

describe NewsController do
  describe 'routing' do
    it 'should route GET / to news#index' do
      expect(get: '/').to route_to(
        controller: 'news',
        action: 'index'
      )
    end

    it 'should route GET /news to news#index' do
      expect(get: '/news').to route_to(
        controller: 'news',
        action: 'index'
      )
    end
  end
end
