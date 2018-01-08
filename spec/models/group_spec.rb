# frozen_string_literal: true

require 'rails_helper'

describe Group do
  it { should be_an(ApplicationRecord) }

  it { should have_many(:feeds).dependent(:destroy) }

  describe '#as_fever_json' do
    let(:group) { create(:group, id: 42, name: 'Bloggers') }

    subject { group.as_fever_json }

    its([:id]) { should eq(42) }

    its([:title]) { should eq('Bloggers') }
  end
end
