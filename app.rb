require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require 'date'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def add_person
    puts 'Do you whant to create a Student (1) 0r Teacher (2)? [input the number]'
    type = gets.chomp.to_i
    case type
    when 1
      puts 'Create a Student'
      puts 'What is your name?'
      name = gets.chomp
      puts 'What is your age?'
      age = gets.chomp
      puts 'Did you get your parent permissiom [Y/N]?'
      parent_permission = gets.chomp.downcase
      add_student_helper(age, name, parent_permission: parent_permission)
    when 2
      puts 'Create a Teacher'
      puts 'What is your name?'
      name = gets.chomp
      puts 'What is your age?'
      age = gets.chomp
      puts 'What is your specialization?'
      specialization = gets.chomp
      add_teacher_helper(age, name, specialization)
    end
  end

  def add_student_helper(age, name, perm)
    student = Student.new(age, name, perm)
    @people.push(student)
    puts 'Student created successfully'
  end

  def add_teacher_helper(age, name, spec)
    teacher = Teacher.new(age, name, spec)
    @people.push(teacher)
    puts 'Teacher created successfully'
  end

  def add_book
    puts 'Add new Book!'
    puts 'Book title :'
    title = gets.chomp
    puts 'Book author :'
    author = gets.chomp
    add_book_helper(author, title)
  end

  def add_book_helper(author, title)
    book = Book.new(author, title)
    @books.push(book)
    puts 'Book created successfully'
  end

  def add_rental
    puts 'Add rental'
    puts 'Select Book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    puts 'Select Person from the following list by number'
    list_people
    person_index = gets.chomp.to_i
    puts "Date: #{Date.today}"
    date = gets.chomp
    add_rental_helper(date, books[book_index], people[person_index])
  end

  def add_rental_helper(date, book, peopl)
    rental = Rental.new(date, book, peopl)
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_books
    @books.each_with_index { |book, index|
      puts "Book: #{index} ID:#{book.id} title: #{book.title} author: #{book.author}"
    }
  end

  def list_people
    @people.each_with_index { |person, index|
      puts "Person: #{index} ID: #{person.id} name: #{person.name}
      age: #{person.age} parent_permission: #{person.parent_permission} "
    }
  end

  def list_rentals
    list_people
    puts 'ID of person:'
    id = gets.chomp.to_i
    person = @people.select { |x| x.id == id }[0]
    if person
      person.rentals.each { |rental| puts "Rental: #{rental.date} book: #{rental.book.title}" }
    else
      puts 'Wron input please try again!!'
    end
  end

  def exit_method
    abort 'Thank you for using this App!'
  end
end
