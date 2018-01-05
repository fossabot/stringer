# frozen_string_literal: true

require 'rails_helper'

describe Setup::PasswordsController do
  describe 'routing' do
    it 'should route GET /setup/password to setup/passwords#show' do
      expect(get: '/setup/password').to route_to(
        controller: 'setup/passwords',
        action: 'show'
      )
    end

    it 'should route POST /setup/password to setup/passwords#create' do
      expect(post: '/setup/password').to route_to(
        controller: 'setup/passwords',
        action: 'create'
      )
    end
  end
end
