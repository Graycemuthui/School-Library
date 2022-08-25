require_relative 'base_decorator'
require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'

class Person < Nameable
  attr_reader :id, :rental
  attr_accessor :age, :name, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental
    @rental.push(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(name: 'maximilianus', age: 22)
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
