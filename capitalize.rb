require_relative 'base_decorator'

class Capitalize < Base_Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
