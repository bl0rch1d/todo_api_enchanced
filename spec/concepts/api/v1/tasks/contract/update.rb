module Api::V1
  module Tasks::Contract
    class Update < Reform::Form
      property :deadline

      validates :deadline, deadline: true
    end
  end
end
