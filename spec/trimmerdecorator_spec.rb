require_relative 'spec_helper'

describe TrimmerDecorator do
  before :each do
    person = Person.new(30, 'maximilianus')
    person.correct_name
    @trimed = TrimmerDecorator.new(person)
  end

  describe '#new' do
    it 'should trim the long string' do
      expect(@trimed.correct_name).to eql 'maximilian'
    end
  end
end
