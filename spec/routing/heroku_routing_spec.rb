# frozen_string_literal: true

require 'rails_helper'

describe HerokuController do
  describe 'routing' do
    it 'should route GET /heroku to heroku#show' do
      expect(get: '/heroku').to route_to(
        controller: 'heroku',
        action: 'show'
      )
    end
  end
end
