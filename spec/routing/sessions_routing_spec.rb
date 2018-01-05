# frozen_string_literal: true

require 'rails_helper'

describe SessionsController do
  describe 'routing' do
    it 'should route GET /session/new to sessions#new' do
      expect(get: '/session/new').to route_to(
        controller: 'sessions',
        action: 'new'
      )
    end

    it 'should route DELETE /session to sessions#destroy' do
      expect(delete: '/session').to route_to(
        controller: 'sessions',
        action: 'destroy'
      )
    end

    it 'should route POST /session to sessions#create' do
      expect(post: '/session').to route_to(
        controller: 'sessions',
        action: 'create'
      )
    end
  end
end
