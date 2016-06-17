module Pageflow
  class MembershipPolicy
    class Scope
      include Pageflow::AdmissionPolicyScopeMixin

      @table_name = 'pageflow_memberships'

      private

      def table_name
        'pageflow_memberships'
      end

      def managed_ids(user)
        user.memberships.on_accounts.where(role: 'manager').map(&:entity_id)
      end
    end
    include Pageflow::AdmissionPolicyMixin
  end
end
