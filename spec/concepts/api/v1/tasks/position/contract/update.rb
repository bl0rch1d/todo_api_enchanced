module Api::V1
  module Tasks::Position::Contract
    class Update < Reform::Form
      property :position

      validates :position, presence: true, numericality: {
        only_integer: true, greater_than_or_equal_to: Task::MIN_POSITION_VALUE
      }
    end
  end
end
