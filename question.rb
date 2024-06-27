class Question

  attr_reader :num1, :num2, :correct_answer

  def initialize(player)
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @correct_answer = @num1 + @num2
    ask(player)
  end

  def ask(player)
    puts "#{player.name}: What is #{num1} plus #{num2}?"
  end

end