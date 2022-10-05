require_relative 'person'
require_relative 'capitalizedecorator'
require_relative 'trimmerdecorator'

person = Person.new(22, 'maximilianus')

p person.correct_name

capitalizedperson = CapitalizeDecorator.new(person)

p capitalizedperson.correct_name

capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)

p capitalizedtrimmedperson.correct_name
