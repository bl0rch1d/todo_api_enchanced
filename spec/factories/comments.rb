FactoryBot.define do
  factory :comment do
    body { FFaker::Lorem.words(5) }
    task
  end
end
