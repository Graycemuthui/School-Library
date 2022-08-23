class Trimmer < Base_Decorator
  def correct_name
    @nameable.correct_name.truncate(10)
  end
end
