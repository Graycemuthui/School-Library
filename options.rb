class Options
  def callMethod(option, methods)
    x = option()
    puts x
    methods.each_with_index do |method, index|
      if x == index + 1
        method
      end
    end
  end  
end
