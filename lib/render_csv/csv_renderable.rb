require 'csv'

module RenderCsv
  module CsvRenderable
    # Converts an array to CSV formatted string
    # Options include:
    # :only => [:col1, :col2] # Specify which columns to include
    # :except => [:col1, :col2] # Specify which columns to exclude
    # :add_methods => [:method1, :method2] # Include addtional methods that aren't columns
    # :attributes => [:col1, :method1, :col2, :col3] # Override set of attributes in specific order
    # :csv_options => { col_sep: '\t', row_sep: '\r\n' } # Optional set of CSV options
    def to_custom_csv(options = {})
      return to_csv unless is_a?(ActiveRecord::Relation)

      if options[:attributes]
        columns = options[:attributes]
      else
        columns = model.column_names
        columns &= options[:only].map(&:to_s) if options[:only]
        columns -= options[:except].map(&:to_s) if options[:except]
        columns += options[:add_methods].map(&:to_s) if options[:add_methods]
      end

      csv_options = default_csv_options.merge(options[:csv_options] || {})

      CSV.generate(csv_options) do |row|
        row << localized_header(columns)
        self.each do |obj|
          row << columns.map { |c| obj.send(c) }
        end
      end
    end

    private

    def localized_header(columns)
      columns.map { |column_name| model.human_attribute_name(column_name) }
    end

    def model
      @model ||= klass
    end

    def default_csv_options
      { encoding: 'utf-8' }
    end
  end
end
