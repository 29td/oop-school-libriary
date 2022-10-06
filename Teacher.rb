require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name = 'Unknown', specialization = 'JavaScript')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
