module Ruboty
  module Actions
    module Mackerel
      class Help < Base
        private

        def get_body
          descriptions = get_all_descriptions
          descriptions.select! { |description| description.include?('mkr') }
          descriptions.join("\n")
        end

        def get_all_descriptions
          Ruboty.actions.reject(&:hidden?).sort.map do |action|
            prefix = ""
            prefix << message.robot.name << " " unless  action.all?
            "#{prefix}#{action.pattern.inspect} - #{action.description}"
          end
        end
      end
    end
  end
end
