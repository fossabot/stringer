# frozen_string_literal: true

require 'rails_helper'

describe FeedsController do
  describe 'routing' do
    it 'should route GET /feeds to feeds#index' do
      expect(get: '/feeds').to route_to(
        controller: 'feeds',
        action: 'index'
      )
    end

    it 'should route POST /feeds to feeds#create' do
      expect(post: '/feeds').to route_to(
        controller: 'feeds',
        action: 'create'
      )
    end

    it 'should route GET /feeds/new to feeds#new' do
      expect(get: '/feeds/new').to route_to(
        controller: 'feeds',
        action: 'new'
      )
    end

    it 'should route GET /feeds/:id/edit to feeds#edit' do
      expect(get: '/feeds/12/edit').to route_to(
        controller: 'feeds',
        action: 'edit',
        id: '12'
      )
    end

    it 'should route PATCH /feeds/:id to feeds#update' do
      expect(patch: '/feeds/12').to route_to(
        controller: 'feeds',
        action: 'update',
        id: '12'
      )
    end

    it 'should route PUT /feeds/:id to feeds#update' do
      expect(put: '/feeds/12').to route_to(
        controller: 'feeds',
        action: 'update',
        id: '12'
      )
    end

    it 'should route DELETE /feeds/:id to feeds#destroy' do
      expect(delete: '/feeds/12').to route_to(
        controller: 'feeds',
        action: 'destroy',
        id: '12'
      )
    end
  end
end
