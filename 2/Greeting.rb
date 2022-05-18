class Greeting
  def greet(firstName,lastName,age)
    if age<18
      text = "Hello, #{firstName} #{lastName}. You are under 18 but start it's never too early to learn to program."
      puts text
      return text
    else
      text = "Hello #{firstName} #{lastName}. Good time to work."
      puts text
      return text
    end
  end
end
