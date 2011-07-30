require './spec/spec_helper'

describe Array do
  let(:sebastian) { Dog.create!(:name => 'Sebastian', :age => 3, :weight => 76.8) }
  let(:ruby) { Dog.create!(:name => 'Ruby', :age => 3, :weight => 68.2) }
  let(:shelby) { Dog.create!(:name => 'Shelby', :age => 5, :weight => 64.0) }
  let(:array) { [sebastian,ruby,shelby] }

  it 'should return an empty string if array is empty' do
    [].to_csv.should eql('')
  end

  it 'should return return a csv of the array if it is not an AR class' do
    [1,2,3].to_csv.should eql('1,2,3')
  end

  it 'should return a all columns with no option' do
    csv = ["id,name,age,weight"]
    csv << ["#{sebastian.id},Sebastian,3,76.8"]
    csv << ["#{ruby.id},Ruby,3,68.2"]
    csv << ["#{shelby.id},Shelby,5,64.0"]

    array.to_csv.should eql(csv.join("\n"))
  end

  it 'should include only columns specified' do
    csv = ["name,age"]
    csv << ["Sebastian,3"]
    csv << ["Ruby,3"]
    csv << ["Shelby,5"]

    options = {:only => [:name, :age] }

    array.to_csv(options).should eql(csv.join("\n"))

  end

  it 'should exclude columns specified' do
    csv = ["id,name,weight"]
    csv << ["#{sebastian.id},Sebastian,76.8"]
    csv << ["#{ruby.id},Ruby,68.2"]
    csv << ["#{shelby.id},Shelby,64.0"]

    options = {:except => [:age] }

    array.to_csv(options).should eql(csv.join("\n"))
  end

  it 'should include method values when specified' do
    csv = ["id,name,age,weight,human_age"]
    csv << ["#{sebastian.id},Sebastian,3,76.8,25"]
    csv << ["#{ruby.id},Ruby,3,68.2,25"]
    csv << ["#{shelby.id},Shelby,5,64.0,33"]

    options = {:add_methods => [:human_age] }

    array.to_csv(options).should eql(csv.join("\n"))

  end

  it 'should include method values with other options' do
    csv = ["age,weight,human_age"]
    csv << ["3,76.8,25"]
    csv << ["3,68.2,25"]
    csv << ["5,64.0,33"]

    options = {:except => [:id,:name], :add_methods => [:human_age] }

    array.to_csv(options).should eql(csv.join("\n"))

  end

end
