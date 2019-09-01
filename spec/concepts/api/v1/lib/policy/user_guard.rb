module Api::V1
  module Lib::Policy
    class UserGuard
      include Uber::Callable

      def call(ctx, **)
        ctx['current_user'].id == user_id(ctx['model'])
      end

      private

      def user_id(record)
        case record
        when Project then record.user_id
        when Task    then record.project.user_id
        when Comment then record.task.project.user_id
        end
      end
    end
  end
end
