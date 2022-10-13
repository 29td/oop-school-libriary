require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new 'Author', 'Title'
  end
  describe '#new' do
    it 'takes 2 parameters and returns a book object' do
      expect(@book).to be_an_instance_of Book
    end
  end
  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eql 'Title'
    end
  end
  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eql 'Author'
    end
  end
end
