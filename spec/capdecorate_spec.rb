require_relative 'spec_helper'

describe Capdecorate do
    context 'With valid arguments' do
      it 'should capitalize name of a person' do
        new_person = Person.new(34, nil, 'nicHolas')
        cap_name = Capdecorate.new(new_person)
        expect(cap_name.correct_name).to eq 'Nicholas'
      end
    end
  end
