require_relative 'base_decorator'

class Capitalize < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
