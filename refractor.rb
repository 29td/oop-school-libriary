require_relative 'app'

class Select
  def select_method(option, app)
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

  def abort_method(option, app)
    app.exit_method unless option != 7
  end
end
