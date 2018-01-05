# frozen_string_literal: true

require 'rails_helper'

describe StoriesController do
  describe 'routing' do
    it 'should route PATCH /stories/:id to stories#update' do
      expect(patch: '/stories/123').to route_to(
        controller: 'stories',
        action: 'update',
        id: '123'
      )
    end

    it 'should route PUT /stories/:id to stories#update' do
      expect(put: '/stories/123').to route_to(
        controller: 'stories',
        action: 'update',
        id: '123'
      )
    end
  end
end
