# frozen_string_literal: true

require 'rails_helper'

describe DebugController do
  describe 'routing' do
    it 'should route GET /debug to debug#show' do
      expect(get: '/debug').to route_to(
        controller: 'debug',
        action: 'show'
      )
    end
  end
end
