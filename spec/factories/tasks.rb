FactoryBot.define do
  factory :task do
    name { FFaker::Lorem.word }
    completed { false }
    position { rand(0..2) }
    deadline { nil }
    project
  end
end
