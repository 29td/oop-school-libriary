class Book
  attr_accessor :author, :title, :rentals

  def initialize(author, title)
    @author = author
    @title = title
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
