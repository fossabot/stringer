# frozen_string_literal: true

class PasswordValidator < ActiveModel::EachValidator
  def validate_each(record, _, value)
    unless record.model&.authenticate(value)
      record.errors.add(:base, 'Wrong password')
    end
  end
end
