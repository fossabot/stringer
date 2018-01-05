# frozen_string_literal: true

require 'rails_helper'

describe StarredNewsController do
  describe 'routing' do
    it 'should route GET /starred to starred_news#index' do
      expect(get: '/starred').to route_to(
        controller: 'starred_news',
        action: 'index'
      )
    end
  end
end
