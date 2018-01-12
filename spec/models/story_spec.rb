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
    let(:feed) { create(:feed, name: 'Superfeed') }

    subject { create(:story, feed: feed) }

    it 'returns the feeds name' do
      expect(subject.source).to eq('Superfeed')
    end
  end

  describe '#pretty_date' do
    subject { build(:story, published: Time.zone.local(2018, 1, 12, 18, 23)) }

    it { expect(subject.pretty_date).to eq('Jan 12, 18:23') }
  end

  # TODO: finish this
  # describe '#as_json' do
  #   let(:feed) { create(:feed, name: 'John Dow') }
  #
  #   let(:story) do
  #     create(:story,
  #            feed: feed,
  #            title: 'Hello World!',
  #            body: 'Welcome!',
  #            published: Time.zone.local(2018, 1, 12, 18, 23, 0))
  #   end
  #
  #   # subject { binding.pry; story.as_json }
  #   # subject { story.as_json }
  #
  #   # its(['headline']) { should eq('Hello World!') }
  #
  #   # its(['lead']) { should eq('Welcome!') }
  #   #
  #   # its(['url']) { should eq('https://example.com/blog/1') }
  #   #
  #   # its(['source']) { should eq('John Dow') }
  #   #
  #   # its(['pretty_date']) { should eq(1515781380) }
  # end

  # def as_json(*)
  #   super(methods: [:headline, :lead, :source, :pretty_date])
  # end

  describe '#as_fever_json' do
    let(:feed) { create(:feed, id: 42, name: 'John Dow') }

    let(:story) do
      create(:story,
             id: 123,
             feed: feed,
             title: 'Hello World!',
             body: 'Welcome!',
             permalink: 'https://example.com/blog/1',
             is_starred: false,
             is_read: true,
             published: Time.zone.local(2018, 1, 12, 18, 23, 0))
    end

    subject { story.as_fever_json }

    it do
      expect(subject.keys.sort).to eq([:author, :created_on_time, :feed_id,
                                       :html, :id, :is_read, :is_saved,
                                       :title, :url])
    end

    its([:id]) { should eq(123) }

    its([:feed_id]) { should eq(42) }

    its([:title]) { should eq('Hello World!') }

    its([:author]) { should eq('John Dow') }

    its([:html]) { should eq('Welcome!') }

    its([:url]) { should eq('https://example.com/blog/1') }

    its([:is_saved]) { should eq(0) }

    its([:is_read]) { should eq(1) }

    its([:created_on_time]) { should eq(1515781380) }
  end
end
