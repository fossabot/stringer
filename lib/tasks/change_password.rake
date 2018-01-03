desc "Change your password"
task change_password: :environment do
  ChangePassword.new.change_password
end
