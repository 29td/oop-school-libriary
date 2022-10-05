require_relative 'person'

class Teacher < person
  attr_accessor :specialization

  def initialize(age, specialization = "JavaScript", name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
