require_relative 'app'

def selection(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.add_person
  when 4
    app.add_book
  when 5
    app.add_rental
  when 6
    app.list_rentals
  end
end

def abord(option, app)
  app.exit_method unless option != 7
end

def main
  app = App.new
  loop do
    puts 'Welcome to School Library App!'
    puts ' '
    puts 'Please choose an option by entering a number'
    puts ' 1 - List all books'
    puts ' 2 - List all people'
    puts ' 3 - Create a person'
    puts ' 4 - Create a book'
    puts ' 5 - Create a rental'
    puts ' 6 - List all rental for a given person id'
    puts ' 7 - Exit '

    option = gets.chomp.to_i

    selection(option, app)
    abord(option, app)
  end
end

main
