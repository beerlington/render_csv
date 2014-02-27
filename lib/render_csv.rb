module RenderCsv
  class RenderCsvRailtie < ::Rails::Railtie
    config.after_initialize do
      require 'render_csv/csv_renderable'
      require 'action_controller/metal/renderers'

      ActionController.add_renderer :csv do |csv, options|
        filename = options[:filename] || options[:template]
        csv.extend RenderCsv::CsvRenderable
        data = csv.respond_to?(:to_csv) ? csv.to_csv(options) : csv
        send_data data, type: Mime::CSV, disposition: "attachment; filename=#{filename}.csv"
      end
    end
  end
end
