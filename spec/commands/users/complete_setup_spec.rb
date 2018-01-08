# frozen_string_literal: true

require 'rails_helper'

describe CompleteSetup do
  let(:user) { build(:user) }

  it 'marks setup as complete' do
    expect(user).to receive(:save).once

    result = CompleteSetup.complete(user)
    expect(result.setup_complete).to eq(true)
  end
end
