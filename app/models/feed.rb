# frozen_string_literal: true

class Feed < ApplicationRecord
  enum status: [:green, :yellow, :red]

  belongs_to :user

  belongs_to :group, optional: true

  has_many :stories, -> { order('published desc') }, dependent: :destroy

  has_many :unread_stories, -> { where(readed: false).order('published desc') }, class_name: 'Story'

  validates :url, presence: true

  validates :url, uniqueness: { scope: :user_id }

  def status_bubble
    return 'yellow' if red? && stories.any?

    status
  end

  def as_fever_json
    {
      id: id,
      favicon_id: 0,
      title: name,
      url: url,
      site_url: url,
      is_spark: 0,
      last_updated_on_time: last_fetched.to_i
    }
  end
end
