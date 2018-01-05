# frozen_string_literal: true

require 'rails_helper'

describe Stories::MarkAllAsReadsController do
  describe 'routing' do
    it 'should route POST /stories/mark_all_as_read to stories/mark_all_as_reads#create' do
      expect(post: '/stories/mark_all_as_read').to route_to(
        controller: 'stories/mark_all_as_reads',
        action: 'create'
      )
    end
  end
end
