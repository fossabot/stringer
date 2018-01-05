# frozen_string_literal: true

class ChangeUserPassword
  def initialize(repository = UserRepository)
    @repo = repository
  end

  def change_user_password(new_password)
    user = @repo.first
    user.password = user.password_confirmation = new_password
    user.api_key = ApiKey.compute(new_password)

    @repo.save(user)
    user
  end
end
