# render_csv

Rails 3 CSV renderer for ActiveRecord collections

## What is it?

The CSV renderer allows you to render any collection as CSV data.

```ruby
class LocationsController < ApplicationController
  def index
    @locations = Location.all

    respond_to do |format|
      format.csv  { render :csv => @locations }
    end
  end
end
```

Will render a CSV file similar to:

<table>
  <tr>
    <th>name</th><th>address</th><th>city</th><th>state</th><th>zip</th><th>created_at</th><th>updated_at</th>
  </tr>
  <tr>
    <td>Pete's House</td><td>555 House Ln</td><td>Burlington</td><td>VT</td><td>05401</td><td>2011-07-26 03:12:44 UTC</td><td>2011-07-26 03:12:44 UTC</td>
    <td>Sebastians's House</td><td>123 Pup St</td><td>Burlington</td><td>VT</td><td>05401</td><td>2011-07-26 03:30:44 UTC</td><td>2011-07-26 03:30:44 UTC</td>
    <td>Someone Else</td><td>999 Herp Derp</td><td>Burlington</td><td>VT</td><td>05401</td><td>2011-07-26 03:30:44 UTC</td><td>2011-07-26 03:30:44 UTC</td>
  </tr>
</table>

## Usage Options

There are a few options you can use to customize which columns are included in the CSV file

### Exclude columns

```ruby
respond_to do |format|
  format.csv  { render :csv => @locations, :except => [:id] }
end
```

### Limit columns

```ruby
respond_to do |format|
  format.csv  { render :csv => @locations, :only => [:address, :zip] }
end
```

### Add methods as columns

```ruby
respond_to do |format|
  format.csv  { render :csv => @locations, :add_methods => [:method1, :method2] }
end
```

### Add methods as columns and exclude columns

```ruby
respond_to do |format|
  format.csv  { render :csv => @locations, :except => [:id], :add_methods => [:method1, :method2] }
end
```

## Contributing to render_csv

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011-2012 Peter Brown. See LICENSE.txt for
further details.

