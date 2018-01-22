# frozen_string_literal: true

require 'rails_helper'

describe UserSignIn, type: :model do
  subject do
    described_class.new(email: 'me@example.com',
                        password: 'password')
  end

  it { should be_an(ActiveModel::Validations) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password) }

  it { should validate_presence_of(:model).with_message('User with given email not found') }

  pending { should validate_password(:password) }

  describe '#save' do
    context 'when form valid' do
      before { expect(subject).to receive(:valid?).and_return(true) }

      it { expect(subject.save).to eq(true) }
    end

    context 'when form not valid' do
      before { expect(subject).to receive(:valid?).and_return(false) }

      it { expect(subject.save).to eq(false) }
    end
  end

  describe '#model' do
    context 'when @user not set' do
      let(:user) { instance_double(User) }

      before do
        #
        # User.where('LOWER(email) = LOWER(?)', email).first # => user
        #
        expect(User).to receive(:where).with('LOWER(email) = LOWER(?)', 'me@example.com') do
          double.tap do |a|
            expect(a).to receive(:first).and_return(user)
          end
        end
      end

      it { expect(subject.model).to eq(user) }
    end

    context 'when @user is set' do
      let(:user) { instance_double(User) }

      before { subject.instance_variable_set(:@user, user) }

      it { expect(subject.model).to eq(user) }
    end
  end
end
