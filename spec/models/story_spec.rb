# frozen_string_literal: true

require 'rails_helper'

describe Story do
  it { should be_an(ApplicationRecord) }

  it { expect(described_class::UNTITLED).to eq('[untitled]') }

  it { should belong_to(:feed) }

  it { should validate_uniqueness_of(:entry_id).scoped_to(:feed_id) }

  describe '#headline' do
    context 'truncates to 50 chars' do
      subject { build(:story, title: Faker::Lorem.sentence(50)) }

      it { expect(subject.headline.size).to eq(50) }
    end

    context 'uses a fallback string if story has no title' do
      subject { build(:story, title: nil) }

      it { expect(subject.headline).to eq(Story::UNTITLED) }
    end

    context 'strips html out' do
      subject { build(:story, title: '<b>Super cool</b> stuff') }

      it { expect(subject.headline).to eq('Super cool stuff') }
    end
  end

  describe '#lead' do
    context 'truncates to 100 chars' do
      subject { build(:story, body: Faker::Lorem.sentence(50)) }

      it { expect(subject.lead.size).to eq(100) }
    end

    context 'strips html out' do
      subject { build(:story, body: "<a href='http://github.com'>Yo</a> dawg") }

      it { expect(subject.lead).to eq('Yo dawg') }
    end
  end

  describe '#source' do
    let(:story) do
      build(:story,
            title: Faker::Lorem.sentence(50),
            body: Faker::Lorem.sentence(50))
    end

    let(:feed) { Feed.new(name: 'Superfeed') }

    before { story.feed = feed }

    it 'returns the feeds name' do
      expect(story.source).to eq(feed.name)
    end
  end
end
