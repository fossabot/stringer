# frozen_string_literal: true

class User < ApplicationRecord
  has_many :feeds, dependent: :destroy

  has_many :stories, through: :feeds

  has_many :unreaded_stories, -> { where(readed: false) },
           through: :feeds,
           source: :stories

  has_many :readed_stories, -> { where(readed: true) },
           through: :feeds,
           source: :stories

  has_many :starred_stories, -> { where(starred: true) },
           through: :feeds,
           source: :stories

  has_secure_password
end
