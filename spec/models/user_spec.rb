# frozen_string_literal: true

require 'rails_helper'

describe User do
  it { should have_secure_password }
end
