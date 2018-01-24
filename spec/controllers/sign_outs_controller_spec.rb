# frozen_string_literal: true

require 'rails_helper'

describe SignOutsController do
  it { should be_an(ApplicationController) }

  it { should use_before_action(:authenticate) }

  describe '#destroy' do
    let(:user) { instance_double(User) }

    before { sign_in(user) }

    before { delete :destroy, format: :html }

    it { should set_flash[:success].to(I18n.t('signout.destroy.flash.logged_out_successfully')) }

    it { should set_session[:user_id].to(nil) }

    it { should redirect_to(root_path) }
  end
end
