class Calculator
  def initialize(numb1, numb2)
    @numb1 = numb1
    @numb2 = numb2
  end
  
  def add
    @numb1 + @numb2 
  end

  def substract
    @numb1 - @numb2
  end
end

calc = Calculator.new(20, 11)
puts calc.add
puts calc.substract
