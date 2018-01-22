# frozen_string_literal: true

require 'rails_helper'

describe SignUpsController do
  it { should be_an(ApplicationController) }

  it { should_not use_before_action(:authenticate) }

  describe '#new' do
    before { get :new, format: :html }

    it { should render_template(:new) }

    it { should respond_with(:ok) }
  end

  describe '#create' do
    context 'when user successful created' do
      let(:user) { create(:user, id: 42) }

      let(:user_sign_up) { instance_double(UserSignUp, model: user, save: true) }

      before do
        #
        # UserSignUp.new(resource_params).with(email: 'john.snow@example.com',
        #                                      password: 'password',
        #                                      password_confirmation: 'password')
        #
        expect(UserSignUp).to receive(:new).with(permitter(email: 'john.snow@example.com',
                                                           password: 'password',
                                                           password_confirmation: 'password'))
                                          .and_return(user_sign_up)
      end

      before do
        post :create, params: {
          sign_up: {
            email: 'john.snow@example.com',
            password: 'password',
            password_confirmation: 'password'
          },
          format: :html
        }
      end

      it { should set_session[:user_id].to(42) }

      it { should redirect_to(news_index_path) }
    end

    context 'when user not created' do
      let(:errors) { instance_double(ActiveModel::Errors, full_messages: ['error1 messages', 'error2 message']) }

      let(:user_sign_up) { instance_double(UserSignUp, errors: errors, save: false) }

      before do
        #
        # UserSignUp.new(resource_params).with(email: 'john.snow@example.com',
        #                                      password: 'password',
        #                                      password_confirmation: 'another-password')
        #
        expect(UserSignUp).to receive(:new).with(permitter(email: 'john.snow@example.com',
                                                           password: 'password',
                                                           password_confirmation: 'another-password'))
                                           .and_return(user_sign_up)
      end

      before do
        post :create, params: {
          sign_up: {
            email: 'john.snow@example.com',
            password: 'password',
            password_confirmation: 'another-password'
          },
          format: :html
        }
      end

      it { should render_template(:new) }

      it { should respond_with(:ok) }

      it { should set_flash[:error].to('error1 messages, error2 message') }
    end
  end
end
