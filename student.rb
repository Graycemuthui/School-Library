require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission = 'true', classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end
end
