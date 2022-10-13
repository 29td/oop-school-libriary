require_relative 'spec_helper'

describe Rental do
  before :each do
    book = Book.new 'Author', 'Title'
    person = Person.new(30, 'Name')
    @rental = Rental.new('2022-10-13', book, person)
  end
  describe '#new' do
    it 'takes 3 parameters and returns a Rental object' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'returns correct rental date' do
      expect(@rental.date).to eql '2022-10-13'
    end
  end
end
