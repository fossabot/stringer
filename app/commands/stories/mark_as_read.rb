# frozen_string_literal: true

class MarkAsRead
  def initialize(story_id, repository = StoryRepository)
    @story_id = story_id
    @repo = repository
  end

  def mark_as_read
    @repo.fetch(@story_id).update_attributes(readed: true)
  end
end
