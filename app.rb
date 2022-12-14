require 'json'
require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require 'date'

# rubocop:disable Metrics/ClassLength

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    load_people
    load_books
    load_rentals
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
    puts "id: #{student.id}, name: #{student.name}, age: #{student.age}, permission: #{student.parent_permission}"
    save_person(student)
    @people.push(student)
    puts 'Student created successfully'
  end

  def add_teacher_helper(age, name, _spec)
    teacher = Teacher.new(specialization, nil, age, name)
    save_person(teacher)
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
    save_book(book)
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
    save_rental(rental)
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def save_rental(rental)
    if File.exist?('rentals.json')
      rentals_loaded = JSON.parse(File.read('rentals.json'))
      rentals_loaded << { date: rental.date, person_id: rental.person.id, book: rental.book.title }
      File.write('rentals.json', JSON.pretty_generate(rentals_loaded))
    else
      File.write('rentals.json',
                 JSON.pretty_generate([{ date: rental.date, person_id: rental.person.id, book: rental.book.title }]))
    end
  end

  def list_books
    @books.each_with_index { |book, index|
      puts "Book: #{index} ID:#{book.id} title: #{book.title} author: #{book.author}"
    }
  end

  def save_book(book)
    if File.exist?('books.json')
      books_loaded = JSON.parse(File.read('books.json'))
      books_loaded << { title: book.title, author: book.author }
      File.write('books.json', JSON.pretty_generate(books_loaded))
    else
      File.write('books.json', JSON.pretty_generate([{ title: book.title, author: book.author }]))
    end
  end

  def load_books
    return unless File.exist?('books.json')

    books_loaded = JSON.parse(File.read('books.json'))
    books_loaded.each do |book|
      new_book = Book.new(book['title'], book['author'])
      @books << new_book
    end
  end

  def save_person(person)
    new_person = nil
    if person.instance_of? Student
      new_person = { id: person.id, age: person.age, name: person.name, parent_permission: person.parent_permission,
                     type: 'student' }
    elsif person.instance_of? Teacher
      new_person = { id: person.id, age: person.age, name: person.name, specialization: person.specialization,
                     type: 'teacher' }
    end
    if File.exist?('people.json')
      people_loaded = JSON.parse(File.read('people.json'))
      people_loaded << new_person
      File.write('people.json', JSON.pretty_generate(people_loaded))
    else
      File.write('people.json', JSON.pretty_generate([new_person]))
    end
  end

  def load_people
    return unless File.exist?('people.json')

    people_loaded = JSON.parse(File.read('people.json'))
    people_loaded.each do |person|
      case person['type']
      when 'student'
        new_person = Student.new(person['age'], person['name'], person['parent_permission'])
        @people << new_person
      when 'teacher'
        new_person = Teacher.new(person['specialization'], person['id'], person['age'], person['name'])
        @people << new_person
      end
    end
  end

  def list_people
    @people.each_with_index { |person, index|
      puts "Person: #{index} ID: #{person.id} name: #{person.name}
      age: #{person.age} parent_permission: #{person.parent_permission} "
    }
  end

  def load_rentals
    return unless File.exist?('rentals.json')

    rentals_loaded = JSON.parse(File.read('rentals.json'))
    rentals_loaded.each do |rental|
      book = @books.select { |x| x.title == rental['book'] }[0]
      person = @people.select { |x| x.id == rental['person_id'] }[0]
      new_rental = Rental.new(rental['date'], book, person)
      rentals << new_rental
    end
  end

  def list_rentals
    list_people
    puts 'ID of person:'
    id = gets.chomp.to_i
    person = @people.select { |x| x.id == id }[0]
    if person
      person.rentals.each { |rental| puts "Rental: #{rental.date} book: #{rental.book.title}" }
    else
      puts 'Wrong input please try again!!'
    end
  end

  def exit_method
    abort 'Thank you for using this App!'
  end
end
# rubocop:enable Metrics/ClassLength
