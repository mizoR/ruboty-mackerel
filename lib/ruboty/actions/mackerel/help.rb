module Ruboty
  module Actions
    module Mackerel
      class Help < Base
        private

        def get_body
          descriptions = get_all_descriptions
          descriptions.select! { |pattern, _| pattern.include?('mkr') }
          "Command not found:\n    #{message.body}\n\nHelp:\n" +
            Terminal::Table.new(rows: descriptions).to_s
        end

        def get_all_descriptions
          Ruboty.actions.reject(&:hidden?).sort.map do |action|
            prefix = ""
            prefix << message.robot.name << " " unless  action.all?
            ["#{prefix}#{action.pattern.inspect}", action.description]
          end
        end
      end
    end
  end
end
