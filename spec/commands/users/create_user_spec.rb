require "rails_helper"

describe CreateUser do
  let(:repo) { double }

  describe "#create" do
    it "remove any existing users and create a user with the password supplied" do
      command = CreateUser.new(repo)

      expect(repo).to receive(:create)
      expect(repo).to receive(:delete_all)

      command.create("password")
    end
  end
end
