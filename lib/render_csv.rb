require 'render_csv/extension'
require 'action_controller/metal/renderers'

ActionController.add_renderer :csv do |csv, options|
  self.response_body = csv.respond_to?(:to_csv) ? csv.to_csv(options) : csv
end
