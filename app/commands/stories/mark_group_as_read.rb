# frozen_string_literal: true

class MarkGroupAsRead
  KINDLING_GROUP_ID = 0
  SPARKS_GROUP_ID   = -1

  def initialize(group_id, timestamp, repository = StoryRepository)
    @group_id  = group_id
    @repo      = repository
    @timestamp = timestamp
  end

  def mark_group_as_read
    return unless @group_id

    if [KINDLING_GROUP_ID, SPARKS_GROUP_ID].include?(@group_id.to_i)
      @repo.fetch_unread_by_timestamp(@timestamp).update_all(readed: true)
    elsif @group_id.to_i > 0
      @repo.fetch_unread_by_timestamp_and_group(@timestamp, @group_id).update_all(readed: true)
    end
  end
end
