# frozen_string_literal: true

require 'rails_helper'

describe User do
  it { should be_an(ApplicationRecord) }

  # it { should validate_presence_of(:email) }
  #
  # it { should validate_uniqueness_of(:email).case_insensitive }

  it { should have_secure_password }
end
