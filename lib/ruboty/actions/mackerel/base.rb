module Ruboty
  module Actions
    module Mackerel
      class Base < ::Ruboty::Actions::Base
        def call
          message.reply(body)
        end

        private

        def body
          get_body
        rescue ::Mackerel::Error => e
          e.message.lines[0..2].join("\n")
        rescue => e
          e.message
        end

        def url_for(params={})
          service_name, role_name, host_id =
            params.values_at(:service_name, :role_name, :host_id)

          case
          when host_id
            "https://mackerel.io/orgs/#{ENV['MACKEREL_ORG']}/hosts/#{host_id}"
          when service_name && role_name
            "https://mackerel.io/orgs/#{ENV['MACKEREL_ORG']}/services/#{service_name}#role=#{role_name}"
          when service_name
            "https://mackerel.io/orgs/#{ENV['MACKEREL_ORG']}/services/#{service_name}"
          else
            raise "Routing not found. (params: #{params})"
          end
        end
      end
    end
  end
end
