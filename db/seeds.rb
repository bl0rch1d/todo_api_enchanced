USERS_COUNT = 3
PROJECTS_COUNT = 9
TASKS_COUNT = 9
COMMENTS_COUNT = 9

USERS_COUNT.times do
  User.create! do |user|
    pasword = FFaker::Internet.password

    user.username = FFaker::Internet.user_name
    user.password = pasword
    user.password = pasword
  end
end

PROJECTS_COUNT.times do
  Project.create! do |project|
    project.name = FFaker::Lorem.word
    project.user = User.all.sample
  end
end

TASKS_COUNT.times do
  Task.create! do |task|
    task.name = FFaker::Lorem.word
    task.project = Project.all.sample
  end
end

COMMENTS_COUNT.times do
  Comment.create! do |comment|
    comment.body = FFaker::Lorem.words(5)
    comment.task = Task.all.sample
  end
end
