# frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    group
    name { "#{ Faker::Name.name } on Software" }
    url { Faker::Internet.url }
    last_fetched { Time.now }
  end
end
