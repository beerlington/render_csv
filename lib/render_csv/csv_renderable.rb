require 'csv'

module RenderCsv
  module CsvRenderable
    # Converts an array to CSV formatted string
    # Options include:
    # :only => [:col1, :col2] # Specify which columns to include
    # :except => [:col1, :col2] # Specify which columns to exclude
    # :add_methods => [:method1, :method2] # Include addtional methods that aren't columns
    def to_csv(options = {})
      return '' if empty?
      return join(',') unless first.class.respond_to? :column_names

      columns = first.class.column_names
      columns &= options[:only].map(&:to_s) if options[:only]
      columns -= options[:except].map(&:to_s) if options[:except]
      columns += options[:add_methods].map(&:to_s) if options[:add_methods]

      CSV.generate(encoding: 'utf-8') do |row|
        row << columns
        self.each do |obj|
          row << columns.map { |c| obj.send(c) }
        end
      end
    end
  end
end
