class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, parent_permission = true, name = 'Unknown')
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    @age >= 18
  end
  private :is_of_age?

  def can_use_services
    is_of_age? || @parent_permission
  end
  public :can_use_services?
end
