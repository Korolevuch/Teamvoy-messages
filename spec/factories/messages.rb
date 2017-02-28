require 'spec_helper'

FactoryGirl.define do
  factory :message do
    description { Faker::Lorem.characters(50) }

    trait :invalid do
      count_visit 3
      exstraction Message::VISIT
    end

    trait :valid do
      count_visit 2
      exstraction Message::VISIT
    end

    trait :valid_hour do
      count_visit 5
      exstraction Message::HOUR
    end
  end
end


