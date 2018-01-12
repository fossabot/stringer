# frozen_string_literal: true

require 'rails_helper'

describe FetchFeedJob do
  describe '#perform' do
    let(:feed) { double }

    before do
      #
      # FetchFeed.new(feed).fetch
      #
      expect(FetchFeed).to receive(:new).with(feed) do
        double.tap do |a|
          expect(a).to receive(:fetch)
        end
      end
    end

    it { expect { subject.perform(feed) }.not_to raise_error }
  end
end
