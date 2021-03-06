require "rails_helper"

describe MarkFeedAsRead do
  describe "#mark_feed_as_read" do
    let(:stories) { double }
    let(:repo) { double(fetch_unread_for_feed_by_timestamp: stories) }

    it "marks feed 1 as read" do
      command = MarkFeedAsRead.new(1, Time.now.to_i, repo)
      expect(stories).to receive(:update_all).with(readed: true)
      command.mark_feed_as_read
    end
  end
end
