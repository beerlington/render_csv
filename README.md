# render_csv

Rails CSV renderer for ActiveRecord collections

## Rails & Ruby Versions Supported

*Rails:* 3.0.x - 4.0.x

*Ruby:* 1.8.7, 1.9.2, 1.9.3 and 2.0.0

## Installation

The gem is hosted at [rubygems.org](https://rubygems.org/gems/render_csv)

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
  </tr>
  <tr>
    <td>Sebastians's House</td><td>123 Pup St</td><td>Burlington</td><td>VT</td><td>05401</td><td>2011-07-26 03:30:44 UTC</td><td>2011-07-26 03:30:44 UTC</td>
  </tr>
  <tr>
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

## Copyright

Copyright (c) 2011-2013 Peter Brown. See LICENSE.txt for
further details.
