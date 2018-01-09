# frozen_string_literal: true

require 'rails_helper'

describe Feed do
  it { should be_an(ApplicationRecord) }

  it { should define_enum_for(:status).with([:green, :yellow, :red]) }

  it { should belong_to(:group) }

  it { should have_many(:stories).order('published desc').dependent(:destroy) }

  it { should have_many(:unread_stories).conditions(is_read: false).order('published desc').class_name('Story') }

  it { should validate_uniqueness_of(:url) }

  describe '#status_bubble' do
    context 'when status red and any story exist' do
      let!(:feed) { create(:feed, status: 'red') }

      let!(:story) { create(:story, feed: feed) }

      subject { feed }

      it { expect(subject.status_bubble).to eq('yellow') }
    end

    context 'when status not red and/or any story not exist' do
      subject { build(:feed, status: 'green') }

      it { expect(subject.status_bubble).to eq('green') }
    end
  end

  describe '#as_fever_json' do
    let!(:now) { Time.zone.now }

    let!(:feed) do
      create(:feed,
             id: 42,
             name: 'Daring Fireball',
             url: 'https://daringfireball.net',
             last_fetched: now)
    end

    subject { feed.as_fever_json }

    its([:id]) { should eq(42) }

    its([:favicon_id]) { should eq(0) }

    its([:title]) { should eq('Daring Fireball') }

    its([:url]) { should eq('https://daringfireball.net') }

    its([:site_url]) { should eq('https://daringfireball.net') }

    its([:is_spark]) { should eq(0) }

    its([:last_updated_on_time]) { should eq(now.to_i) }
  end
end
