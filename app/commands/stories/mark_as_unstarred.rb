# frozen_string_literal: true

class MarkAsUnstarred
  def initialize(story_id, repository = StoryRepository)
    @story_id = story_id
    @repo = repository
  end

  def mark_as_unstarred
    @repo.fetch(@story_id).update_attributes(starred: false)
  end
end
