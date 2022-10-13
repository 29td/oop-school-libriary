require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(30, 'Name')
  end

  describe '#new' do
    it 'takes 3 parameters and returns a Person object' do
      expect(@person).to be_an_instance_of Person
    end
  end

  describe '#age' do
    it 'it return the correct age' do
      expect(@person.age).to eql 30
    end
  end
  describe '#name' do
    it 'it return the correct age' do
      expect(@person.name).to eql 'Name'
    end
  end
end
