require 'securerandom'

class Book
  attr_accessor :author, :title
  attr_reader :rentals, :id

  def initialize(author, title)
    @id = Random.rand(1..100)
    @author = author
    @title = title
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
