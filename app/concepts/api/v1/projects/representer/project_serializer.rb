module Api::V1
  module Projects::Representer
    class ProjectSerializer
      include FastJsonapi::ObjectSerializer

      attributes :name

      belongs_to :user
      has_many :tasks
    end
  end
end
