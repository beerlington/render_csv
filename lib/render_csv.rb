module RenderCsv
  class RenderCsvRailtie < ::Rails::Railtie
    config.after_initialize do
      require 'render_csv/csv_renderable'
      require 'action_controller/metal/renderers'

      ActionController.add_renderer :csv do |csv, options|
        filename = options[:filename] || options[:template]
        csv.extend RenderCsv::CsvRenderable
        data = csv.to_csv(options)
        send_data data, type: Mime[:csv], disposition: "attachment; filename=#{filename}.csv"
      end
    end
  end
end
