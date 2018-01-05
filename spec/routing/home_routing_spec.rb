# frozen_string_literal: true

require 'rails_helper'

describe HomeController do
  describe 'routing' do
    it 'should route GET / to home#index' do
      expect(get: '/').to route_to(
        controller: 'home',
        action: 'index'
      )
    end
  end
end
