# frozen_string_literal: true

require 'rails_helper'

describe UserSignUp do
  context 'when email not used and password with confirmation match' do
    subject do
      described_class.new(email: 'me@example.com',
                          password: 'password',
                          password_confirmation: 'password')
    end

    it { expect(subject.save).to eq(true) }
  end

  context 'when email not user and password do not match confirmation' do
    subject do
      described_class.new(email: 'me@example.com',
                          password: 'password',
                          password_confirmation: 'another-password')
    end

    it { expect(subject.save).to eq(false) }

    it { expect { subject.save }.to change { subject.errors.full_messages }.from([]).to(["Password confirmation doesn't match Password"]) }
  end

  context 'when email used and password with confirmation match' do
    let!(:user) { create(:user, email: 'me@example.com') }

    subject do
      described_class.new(email: 'me@example.com',
                          password: 'password',
                          password_confirmation: 'password')
    end

    it { expect(subject.save).to eq(false) }

    it { expect { subject.save }.to change { subject.errors.full_messages }.from([]).to(['Email has already been taken']) }
  end

  context 'when email was not used before and password with confirmation match' do
    let!(:user) { create(:user, email: 'me@example.com') }

    subject do
      described_class.new(email: 'me@example.com',
                          password: 'password',
                          password_confirmation: 'password')
    end

    before { expect(subject).to receive(:email_uniqueness).and_return(true) }

    it { expect(subject.save).to eq(false) }

    it { expect { subject.save }.to change { subject.errors.full_messages }.from([]).to(['Email has already been taken']) }
  end
end
