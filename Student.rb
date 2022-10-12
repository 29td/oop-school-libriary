require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, id, name = 'Unknown', classroom = 5, parent_permission: true)
    super(age, id, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
