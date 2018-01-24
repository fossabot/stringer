# frozen_string_literal: true

class UserSignIn
  include ActiveModel::Validations

  attr_accessor :email, :password, :model

  validates :email, presence: true

  validates :password, presence: true

  validates :model, presence: { message: 'User with given email not found' }

  validates :password, password: true

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
end
