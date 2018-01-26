# frozen_string_literal: true

require 'rails_helper'

describe User do
  it { should be_an(ApplicationRecord) }

  it { should have_many(:feeds).dependent(:destroy) }

  it { should have_many(:stories).through(:feeds) }

  it { should have_many(:unread_stories).conditions(readed: false).through(:feeds).source(:stories) }

  it { should have_many(:starred_stories).conditions(starred: true).through(:feeds).source(:stories) }

  it { should have_secure_password }
end
