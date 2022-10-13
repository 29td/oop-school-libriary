require_relative 'spec_helper'

describe Student do
  before :each do
    @student = Student.new(30, 'Name', 5)
  end

  describe '#new' do
    it 'takes 3 parameters and returns a Student object' do
      expect(@student).to be_an_instance_of Student
    end
  end

  describe '#age' do
    it 'it return the correct age' do
      expect(@student.age).to eql 30
    end
  end
  describe '#name' do
    it 'it return the correct age' do
      expect(@student.name).to eql 'Name'
    end
  end
end
