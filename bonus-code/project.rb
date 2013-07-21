class Project
  attr_accessor :name
  attr_reader :funding, :target

  def initialize(name, target_funding_amount, funding=0)
    @name = name
    @target = target_funding_amount
    @funding = funding
  end

  def add_funds
    @funding += 25
    puts "#{@name} got some funds!"
  end

  def substract_funds
    @funding -= 15
    puts "#{@name} lost some funds!"
  end

  def funding_needed
    @target - @funding 
  end

  def fully_funded?
    funding_needed <= 0
  end

  def <=>(other)
    other.funding_needed <=> funding_needed
  end 

  def to_s
   "#{@name} has $#{@funding} in funding towards a goal of $#{@target}."
  end
end
