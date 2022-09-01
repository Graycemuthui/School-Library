require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :type

  def initialize(age, specialization, name = 'Unknown', parent_permission = true, id = rand(1..1000))
    super(age, name, parent_permission, id)
    @specialization = specialization
    @type = 'teacher'
  end

  def can_use_services
    true
  end
end
