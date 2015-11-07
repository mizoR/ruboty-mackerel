module Ruboty
  module Actions
    module Mackerel
      class ListServiceRoles < Base
        private

        def get_body
          roles = ::Mackerel.roles(service_name)
          list = roles.map {|r| "- #{r.name} | #{url_for(service_name: service_name, role_name: r.name)}"}
          list << "#{roles.count} roles in services/#{service_name}"
          list.join("\n")
        end

        def service_name
          message[1]
        end
      end
    end
  end
end
