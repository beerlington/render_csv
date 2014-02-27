$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rails/all'
require 'rspec/rails'
require 'render_csv/csv_renderable'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.color_enabled = true
end

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define(:version => 1) do
  create_table :dogs, :force => true do |t|
    t.string :name
    t.integer :age
    t.float :weight
  end
end

class Dog < ActiveRecord::Base
  validates_presence_of :name, :age, :weight

  def human_age
    if age <= 2
      (age * 10.5).to_i
    else
      (2 * 10.5 + (age - 2) * 4).to_i
    end
  end
end
