require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(30, 'Name', 'special')
  end

  describe '#new' do
    it 'takes 4 parameters and returns a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
  end

  describe '#age' do
    it 'it return the correct age' do
      expect(@teacher.age).to eql 30
    end
  end
  describe '#name' do
    it 'it return the correct age' do
      expect(@teacher.name).to eql 'Name'
    end
  end
  describe '#specialization' do
    it 'it return the correct age' do
      expect(@teacher.specialization).to eql 'special'
    end
  end
end
