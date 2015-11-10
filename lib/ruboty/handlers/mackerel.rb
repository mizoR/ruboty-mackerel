module Ruboty
  module Handlers
    class Mackerel < Base
      env :MACKEREL_APIKEY, "Mackerel api key"
      env :MACKEREL_ORG,    "Mackerel organization"

      on %r<mkr services?$>,                          name: 'list_services',           description: 'List services.'
      on %r<mkr services? (\w+) roles?$>,             name: 'list_service_roles',      description: 'List service roles.'
      on %r<mkr services? (\w+) roles? (\w+) hosts$>, name: 'list_service_role_hosts', description: 'List service role hosts.'
      on %r<mkr services? (\w+) hosts?$>,             name: 'list_service_hosts',      description: 'List service hosts.'
      on %r<mkr(.+)?>,                                name: 'help',                    description: 'Help.', missing: true, hidden: true

      def list_services(message)
        Ruboty::Actions::Mackerel::ListServices.new(message).call
      end

      def list_service_roles(message)
        Ruboty::Actions::Mackerel::ListServiceRoles.new(message).call
      end

      def list_service_role_hosts(message)
        Ruboty::Actions::Mackerel::ListServiceRoleHosts.new(message).call
      end

      def list_service_hosts(message)
        Ruboty::Actions::Mackerel::ListServiceHosts.new(message).call
      end

      def help(message)
        Ruboty::Actions::Mackerel::Help.new(message).call
      end
    end
  end
end
