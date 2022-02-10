module GraphiQL
  module Rails
    class EditorsController < ActionController::Base
      content_security_policy do |policy|
        policy.script_src(*policy.script_src, :unsafe_eval)
      end if respond_to?(:content_security_policy)

      def show
      end

      helper_method :graphql_endpoint_path
      def graphql_endpoint_path
        params[:graphql_path] || raise(%|You must include `graphql_path: "/my/endpoint"` when mounting GraphiQL::Rails::Engine|)
      end
    end
  end
end
