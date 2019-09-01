module Api::V1
  module Tasks::Position::Contract
    class Update < Reform::Form
      property :position

      validates :position, presence: true, numericality: { only_integer: true }
    end
  end
end
