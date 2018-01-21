# frozen_string_literal: true

class User < ApplicationRecord
  has_many :feeds, dependent: :destroy

  has_many :stories, through: :feeds

  has_secure_password
end
