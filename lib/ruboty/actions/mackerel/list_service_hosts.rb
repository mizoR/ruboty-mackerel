module Ruboty
  module Actions
    module Mackerel
      class ListServiceHosts < Base
        private

        def get_body
          hosts = ::Mackerel.hosts(service: service_name)
          rows = hosts.map {|h| [h.status, h.id, h.name, url_for(host_id: h.id)]}
          Terminal::Table.new(rows: rows).to_s +
            "\n#{hosts.count} hosts in services/#{service_name}"
        end

        def service_name
          message[1]
        end
      end
    end
  end
end
