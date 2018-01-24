# frozen_string_literal: true

require 'rails_helper'

describe SignInsController do
  it { should be_an(ApplicationController) }

  it { should_not use_before_action(:authenticate) }

  describe '#new' do
    before { get :new, format: :html }

    it { should render_template(:new) }

    it { should respond_with(:ok) }
  end

  describe '#create' do
    context 'when user successful signed in' do
      let(:user) { create(:user, id: 42) }

      let(:form) { instance_double(UserSignIn, model: user, save: true) }

      before do
        #
        # UserSignIn.new(resource_params)
        #           .with(email: 'me@example.com',
        #                 password: 'password') # => form
        #
        expect(UserSignIn).to receive(:new).with(permitter(email: 'me@example.com',
                                                           password: 'password'))
                                           .and_return(form)
      end

      before do
        post :create, params: {
          sign_in: {
            email: 'me@example.com',
            password: 'password'
          },
          format: :html
        }
      end

      it { should set_session[:user_id].to(42) }

      it { should redirect_to(news_index_path) }
    end

    context 'when user not signed in' do
      let(:errors) { instance_double(ActiveModel::Errors, full_messages: ['error1 messages', 'error2 message']) }

      let(:form) { instance_double(UserSignIn, errors: errors, save: false) }

      before do
        #
        # UserSignIn.new(resource_params)
        #           .with(email: 'me@example.com',
        #                 password: 'password') # => form
        #
        expect(UserSignIn).to receive(:new).with(permitter(email: 'me@example.com',
                                                           password: 'password'))
                                           .and_return(form)
      end

      before do
        post :create, params: {
          sign_in: {
            email: 'me@example.com',
            password: 'password'
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
