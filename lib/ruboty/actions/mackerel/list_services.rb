module Ruboty
  module Actions
    module Mackerel
      class ListServices < Base
        private

        def get_body
          services = ::Mackerel.services
          list = services.map {|s| "- #{s.name} | #{url_for(service_name: s.name)}"}
          list.join("\n")
        end
      end
    end
  end
end
