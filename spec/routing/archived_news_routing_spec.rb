# frozen_string_literal: true

require 'rails_helper'

describe ArchivedNewsController do
  describe 'routing' do
    it 'should route GET /archive to archived_news#index' do
      expect(get: '/archive').to route_to(
        controller: 'archived_news',
        action: 'index'
      )
    end
  end
end
