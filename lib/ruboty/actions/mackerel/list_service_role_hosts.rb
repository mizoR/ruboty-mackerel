module Ruboty
  module Actions
    module Mackerel
      class ListServiceRoleHosts < Base
        private

        def get_body
          hosts = ::Mackerel.hosts(service: service_name, role: role_name)
          rows = hosts.map {|h| [h.status, h.id, h.name, url_for(host_id: h.id)]}
          Terminal::Table.new(rows: rows).to_s +
            "\n#{hosts.count} hosts in services/#{service_name}/roles/#{role_name}"
        end

        def service_name
          message[1]
        end

        def role_name
          message[2]
        end
      end
    end
  end
end
