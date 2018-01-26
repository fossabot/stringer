# frozen_string_literal: true

class Story < ApplicationRecord
  UNTITLED = '[untitled]'

  belongs_to :feed

  validates :entry_id, uniqueness: { scope: :feed_id }

  def headline
    title.nil? ? UNTITLED : strip_html(title)[0, 50]
  end

  def lead
    strip_html(body)[0, 100]
  end

  # TODO: just delegate to :feed
  def source
    feed.name
  end

  def pretty_date
    I18n.l(published)
  end

  def as_json(*)
    super(methods: [:headline, :lead, :source, :pretty_date])
  end

  def as_fever_json
    {
      id: id,
      feed_id: feed_id,
      title: title,
      author: source,
      html: body,
      url: permalink,
      is_saved: starred ? 1 : 0,
      is_read: is_read ? 1 : 0,
      created_on_time: published.to_i
    }
  end

  private

  def strip_html(contents)
    Loofah.fragment(contents).text
  end
end
