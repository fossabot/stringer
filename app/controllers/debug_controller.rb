# frozen_string_literal: true

class DebugController < ApplicationController
  skip_before_action :authenticate

  def show
    @user_agent = request.user_agent
  end
end
