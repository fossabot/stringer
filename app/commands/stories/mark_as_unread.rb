# frozen_string_literal: true

class MarkAsUnread
  def initialize(story_id, repository = StoryRepository)
    @story_id = story_id
    @repo = repository
  end

  def mark_as_unread
    @repo.fetch(@story_id).update_attributes(readed: false)
  end
end
