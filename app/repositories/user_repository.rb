# frozen_string_literal: true

class UserRepository
  def self.setup_complete?
    User.first&.setup_complete?
  end

  def self.save(user)
    user.save
    user
  end

  def self.first
    User.first
  end
end
