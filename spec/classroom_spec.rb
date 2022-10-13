require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Label')
  end

  describe '#new' do
    it 'takes 1 parameter and return an Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#lable' do
    it 'should return correct label' do
      expect(@classroom.label).to eql 'Label'
    end
  end
end
