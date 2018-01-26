# frozen_string_literal: true

class User < ApplicationRecord
  has_many :feeds, dependent: :destroy

  has_many :stories, through: :feeds

  has_many :starred_stories, -> { where(starred: true) },
           through: :feeds,
           source: :stories,
           class_name: 'Story'

  has_secure_password
end
