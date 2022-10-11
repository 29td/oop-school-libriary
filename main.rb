require_relative 'refactor'

puts 'Welcome to School Library App!'
puts ' '

def main
  app = App.new
  loop do
    puts 'Please choose an option by entering a number'
    puts ' 1 - List all books'
    puts ' 2 - List all people'
    puts ' 3 - Create a person'
    puts ' 4 - Create a book'
    puts ' 5 - Create a rental'
    puts ' 6 - List all rental for a given person id'
    puts ' 7 - Exit '

    option = gets.chomp.to_i
    select = Select.new
    select.select_method(option, app)
    select.abort_method(option, app)
  end
end

main
