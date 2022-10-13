require_relative 'spec_helper'

describe CapitalizeDecorator do
  before :each do
    person = Person.new(30, 'maximilianus')
    person.correct_name
    @capital = CapitalizeDecorator.new(person)
  end

  describe '#new' do
    it 'should capitalize the string' do
      expect(@capital.correct_name).to eql 'Maximilianus'
    end
  end
end
