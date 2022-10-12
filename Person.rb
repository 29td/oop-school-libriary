require_relative 'nameable'
require 'securerandom'

class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission
  attr_reader :rentals

  def initialize(age, id, name = 'Unknown', parent_permission: true)
    super()
    @id = id || rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? >= 18 || @parent_permission
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
