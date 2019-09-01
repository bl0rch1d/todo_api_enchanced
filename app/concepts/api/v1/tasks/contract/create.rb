module Api::V1
  module Tasks::Contract
    class Create < Reform::Form
      property :name

      validates :name, presence: true, length: { maximum: Task::MAX_NAME_LENGTH }
    end
  end
end
