# frozen_string_literal: true

require 'rails_helper'

describe FetchFeedsJob do
  describe '#perform' do
    let(:feed) { create(:feed) }

    before do
      #
      # Feed.find_each # => feed
      #
      expect(Feed).to receive(:find_each).and_yield(feed)
    end

    before do
      #
      # FetchFeedJob.perform_later(feed)
      #
      expect(FetchFeedJob).to receive(:perform_later).with(feed)
    end

    it { expect { subject.perform }.not_to raise_error }
  end
end
