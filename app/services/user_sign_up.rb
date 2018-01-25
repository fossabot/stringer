# frozen_string_literal: true

class UserSignUp
  include ActiveModel::Validations

  attr_accessor :email, :password, :password_confirmation

  validates :email, presence: true

  validates :password, presence: true

  validates :password_confirmation, presence: true

  validates :password, confirmation: true

  validates :password, password_strength: true

  def initialize(params)
    @email = params[:email]
    @password = params[:password]
    @password_confirmation = params[:password_confirmation]
  end

  def save
    valid? && model.save
  rescue ActiveRecord::RecordNotUnique
    errors.add(:email, I18n.t('errors.messages.taken'))

    false
  end

  def model
    @user ||= User.new(email: email,
                       password: password,
                       password_confirmation: password_confirmation)
  end
end
