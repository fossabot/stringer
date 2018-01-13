# frozen_string_literal: true

class UserSignIn
  include ActiveModel::Validations

  attr_reader :email, :password

  validates :email, presence: true

  validates :password, presence: true

  validate :user_presence

  validate :user_password

  def initialize(params)
    @email = params[:email]
    @password = params[:password]
  end

  def save
    valid?
  end

  def model
    @user ||= User.where('LOWER(email) = LOWER(?)', email).first
  end

  private

  def user_presence
    errors.add(:email, 'User with given email not found') if !model
  end

  def user_password
    return if !model

    errors.add(:password, 'Wrong password') if !model.authenticate(password)
  end
end
