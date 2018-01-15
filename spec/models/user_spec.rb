# frozen_string_literal: true

require 'rails_helper'

describe User do
  it { should be_an(ApplicationRecord) }

  it { should have_many(:feeds).dependent(:destroy) }

  it { should have_many(:stories).through(:feeds) }

  # it { should validate_presence_of(:email) }
  #
  # it { should validate_uniqueness_of(:email).case_insensitive }

  it { should have_secure_password }
end
