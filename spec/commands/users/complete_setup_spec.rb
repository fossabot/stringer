require "rails_helper"

xdescribe CompleteSetup do
  let(:user) { UserFactory.build }
  it "marks setup as complete" do
    expect(user).to receive(:save).once

    result = CompleteSetup.complete(user)
    expect(result.setup_complete).to eq(true)
  end
end
