# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :feeds, dependent: :destroy

  def as_fever_json
    { id: id, title: name }
  end
end
