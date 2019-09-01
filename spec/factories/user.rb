FactoryBot.define do
  factory :user do
    password = FFaker::Internet.password

    username { FFaker::Lorem.words(2).join }
    password { password }
    password_confirmation { password }

    trait :with_project do
      projects { create_list(:project, 1) }
    end

    trait :with_project_with_task do
      projects { create_list(:project, 1, :with_task) }
    end

    trait :with_project_with_task_with_comments do
      projects { create_list(:project, 1, :with_task) }

      after :create do |user|
        user.projects.first.tasks.first.comments = create_list(:comment, 2)
      end
    end
  end
end
