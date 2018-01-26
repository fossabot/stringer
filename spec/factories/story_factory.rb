# frozen_string_literal: true

FactoryBot.define do
  factory :story do
    feed
    title { Faker::Lorem.sentence }
    permalink { Faker::Internet.url }
    body { Faker::Lorem.paragraph }
    is_read false
    starred false
    published { Time.zone.now }
  end
end

# require_relative "./feed_factory"
#
# class StoryFactory
#   class FakeStory < OpenStruct
#     def headline
#       title[0, 50]
#     end
#
#     def source
#       feed.name
#     end
#
#     def as_fever_json
#       {
#         id: id,
#         feed_id: feed_id,
#         title: title,
#         author: source,
#         html: body,
#         url: permalink,
#         is_saved: starred ? 1 : 0,
#         is_read: is_read ? 1 : 0,
#         created_on_time: published.to_i
#       }
#     end
#   end
#
#   def self.build(params = {})
#     default_params = {
#       id: rand(100),
#       title: Faker::Lorem.sentence,
#       permalink: Faker::Internet.url,
#       body: Faker::Lorem.paragraph,
#       feed: FeedFactory.build,
#       is_read: false,
#       starred: false,
#       published: Time.now
#     }
#     FakeStory.new(default_params.merge(params))
#   end
# end
