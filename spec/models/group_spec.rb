# frozen_string_literal: true

require 'rails_helper'

describe Group do
  it { should have_many(:feeds).dependent(:destroy) }

  describe '#as_fever_json' do
    let(:group) { create(:group, id: 42, name: 'Daring Fireball') }

    subject { group.as_fever_json }

    its([:id]) { should eq(42) }

    its([:title]) { should eq('Daring Fireball') }
  end
end
