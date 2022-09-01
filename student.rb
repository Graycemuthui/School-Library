require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom, :type

  def initialize(age, classroom, name = 'Unknown', parent_permission = true, id = rand(1..1000))
    super(age, name, parent_permission, id)
    @classroom = classroom
    @type = 'student'
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end
end
