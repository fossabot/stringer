# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # DEPRECATED: remove this
  def setup_complete?
    setup_complete
  end
end
