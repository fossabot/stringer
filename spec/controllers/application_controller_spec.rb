# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController do
  it { should be_a(HttpAcceptLanguage::AutoLocale) }
end
