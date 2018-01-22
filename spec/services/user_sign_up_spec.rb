# frozen_string_literal: true

require 'rails_helper'

describe UserSignUp, type: :model do
  subject do
    described_class.new(email: 'me@example.com',
                        password: 'password',
                        password_confirmation: 'password')
  end

  it { should be_an(ActiveModel::Validations) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password) }

  it { should validate_presence_of(:password_confirmation) }

  it { should validate_confirmation_of(:password) }

  describe '#save' do
    context 'when form valid' do
      let(:user) { instance_double(User, save: true) }

      before { expect(subject).to receive(:valid?).and_return(true) }

      before { subject.instance_variable_set(:@user, user) }

      it { expect(subject.save).to eq(true) }
    end

    context 'when form not valid' do
      before { expect(subject).to receive(:valid?).and_return(false) }

      it { expect(subject.save).to eq(false) }
    end

    context 'when form valid but email already taken' do
      let(:user) { instance_double(User) }

      before { expect(subject).to receive(:valid?).and_return(true) }

      before { subject.instance_variable_set(:@user, user) }

      before { expect(user).to receive(:save).and_raise(ActiveRecord::RecordNotUnique) }

      it { expect(subject.save).to eq(false) }

      it { expect { subject.save }.to change { subject.errors[:email] }.from([]).to([I18n.t('errors.messages.taken')]) }
    end
  end

  describe '#model' do
    context 'when @user not set' do
      let(:user) { instance_double(User) }

      before do
        #
        # User.new(email: email,
        #          password: password,
        #          password_confirmation: password_confirmation) # => user
        #
        expect(User).to receive(:new).with(email: 'me@example.com',
                                           password: 'password',
                                           password_confirmation: 'password')
                                     .and_return(user)
      end

      it { expect { subject.model }.not_to raise_error }

      it { expect { subject.model }.to change { subject.instance_variable_get(:@user) }.from(nil).to(user) }
    end

    context 'when @user is set' do
      let(:user) { instance_double(User) }

      before { subject.instance_variable_set(:@user, user) }

      it { expect(subject.model).to eq(user) }
    end
  end
end
