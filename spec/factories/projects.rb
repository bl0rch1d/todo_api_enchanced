FactoryBot.define do
  factory :project do
    name { FFaker::Lorem.word }
    user

    trait :with_task do
      tasks { create_list(:task, 1) }
    end
  end
end
