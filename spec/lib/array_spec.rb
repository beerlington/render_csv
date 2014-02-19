require './spec/spec_helper'

describe Array do
  let(:sebastian) { Dog.create!(name: "Sebastian O'Connor", age: 3, weight: 76.8) }
  let(:ruby) { Dog.create!(name: 'Ruby', age: 3, weight: 68.2) }
  let(:shelby) { Dog.create!(name: 'Shelby', age: 5, weight: 64.0) }
  let(:array) { [sebastian, ruby, shelby] }

  context 'array is empty' do
    it 'returns an empty string' do
      expect([].to_csv).to eql('')
    end
  end

  context 'object is not an instance of AR class' do
    it 'returns a csv of the array' do
      expect([1, 2, 3].to_csv).to eql('1,2,3')
    end
  end

  context 'options is blank' do
    it 'returns all columns' do
      expect(array.to_csv).to eql "id,name,age,weight\n1,Sebastian O'Connor,3,76.8\n2,Ruby,3,68.2\n3,Shelby,5,64.0\n"
    end
  end

  context 'options with :only param' do
    it 'returns only columns specified' do
      options = { only: [:name, :age] }

      expect(array.to_csv(options)).to eql "name,age\nSebastian O'Connor,3\nRuby,3\nShelby,5\n"
    end
  end

  context 'options with :exclude param' do
    it 'excludes columns specified' do
      options = { except: [:age] }

      expect(array.to_csv(options)).to eql "id,name,weight\n7,Sebastian O'Connor,76.8\n8,Ruby,68.2\n9,Shelby,64.0\n"
    end
  end

  context 'options with :add_methods' do
    it 'includes specified method values' do
      options = { add_methods: [:human_age] }

      expect(array.to_csv(options)).to eql "id,name,age,weight,human_age\n10,Sebastian O'Connor,3,76.8,25\n11,Ruby,3,68.2,25\n12,Shelby,5,64.0,33\n"
    end
  end

  context 'options with :expect and :add_methods' do
    it 'includes method values with other options' do
      options = { except: [:id,:name], add_methods: [:human_age] }

      expect(array.to_csv(options)).to eql "age,weight,human_age\n3,76.8,25\n3,68.2,25\n5,64.0,33\n"
    end
  end

end
