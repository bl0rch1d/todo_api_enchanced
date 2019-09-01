module Api::V1
  module Tasks::Contract
    class Update < Reform::Form
      property :name
      property :deadline

      validates :name, presence: true, length: { maximum: Task::MAX_NAME_LENGTH }
      validates :deadline, deadline: true
    end
  end
end
