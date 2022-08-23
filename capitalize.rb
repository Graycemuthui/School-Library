class Capitalize < Base_Decorator
  def correct_name
    @nameable.correct_name.upcase
  end
end
