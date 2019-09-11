module Api::V1
  module Projects::Contract
    class Create < Reform::Form
      property :name

      validates :name, presence: true, length: { maximum: Project::MAX_NAME_LENGTH }
    end
  end
end
