require 'csv'

module RenderCsv
  module CsvRenderable
    # Converts an array to CSV formatted string
    # Options include:
    # :only => [:col1, :col2] # Specify which columns to include
    # :except => [:col1, :col2] # Specify which columns to exclude
    # :add_methods => [:method1, :method2] # Include additional methods that aren't columns
    # :headers => { col1: 'human col1 name', col2: 'human col2 name'} # header column human names
    def to_csv(options = {})
      return '' if empty?
      return join(',') unless first.class.respond_to? :column_names

      columns = first.class.column_names
      columns &= options[:only].map(&:to_s) if options[:only]
      columns -= options[:except].map(&:to_s) if options[:except]
      columns += options[:add_methods].map(&:to_s) if options[:add_methods]
      if options[:headers]
        column_names = columns.collect { |c| options[:headers][c.to_sym] || c }
      else
        column_names = columns
      end

      CSV.generate(encoding: 'utf-8') do |row|
        row << column_names
        self.each do |obj|
          row << columns.map { |c| obj.send(c) }
        end
      end
    end
  end
end
