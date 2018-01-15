# frozen_string_literal: true

class User < ApplicationRecord
  has_many :feeds, dependent: :destroy

  has_many :stories, through: :feeds

  # validates :email, presence: true
  #
  # validates :email, uniqueness: { case_sensitive: false }

  has_secure_password
end
