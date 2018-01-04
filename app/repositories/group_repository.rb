# frozen_string_literal: true

class GroupRepository
  def self.list
    Group.order("LOWER(name)")
  end
end
