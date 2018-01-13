# frozen_string_literal: true

require 'rails_helper'

describe UserSignIn do
  context 'when user with given email found and password correct' do
    let!(:user) { create(:user, email: 'me@example.com', password: 'password') }

    subject { described_class.new(email: 'me@example.com', password: 'password') }

    it { expect(subject.save).to eq(true) }

    it { expect { subject.save }.not_to change { subject.errors.messages }.from({}) }
  end

  context 'when user with given email found and password wrong' do
    let!(:user) { create(:user, email: 'me@example.com', password: 'password') }

    subject { described_class.new(email: 'me@example.com', password: 'wrong-password') }

    it { expect(subject.save).to eq(false) }

    it { expect { subject.save }.to change { subject.errors.messages }.from({}).to(password: ['Wrong password']) }
  end

  context 'when user with given email not found' do
    subject { described_class.new(email: 'me@example.com', password: 'password') }

    it { expect(subject.save).to eq(false) }

    it { expect { subject.save }.to change { subject.errors.messages }.from({}).to(email: ['User with given email not found']) }
  end

  context 'when user try sign in with UPPER case email' do
    let!(:user) { create(:user, email: 'me@example.com', password: 'password') }

    subject { described_class.new(email: 'ME@EXAMPLE.COM', password: 'password') }

    it { expect(subject.save).to eq(true) }

    it { expect { subject.save }.not_to change { subject.errors.messages }.from({}) }
  end
end
