module Ruboty
  module Actions
    module Mackerel
      class ListServices < Base
        private

        def get_body
          services = ::Mackerel.services
          rows = services.map {|s| [s.name, url_for(service_name: s.name)]}
          Terminal::Table.new(rows: rows).to_s +
            "\n#{services.count} services"
        end
      end
    end
  end
end
