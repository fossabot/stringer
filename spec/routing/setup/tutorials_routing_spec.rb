# frozen_string_literal: true

require 'rails_helper'

describe Setup::TutorialsController do
  describe 'routing' do
    it 'should route GET /setup/tutorial to setup/tutorials#show' do
      expect(get: '/setup/tutorial').to route_to(
        controller: 'setup/tutorials',
        action: 'show'
      )
    end
  end
end
