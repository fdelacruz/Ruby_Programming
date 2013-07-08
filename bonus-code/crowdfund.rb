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

  def to_s
   "#{@name} has $#{@funding} in funding towards a goal of $#{@target}."
  end
end

project1 = Project.new("Project LMN", 3000, 500)
puts project1
project1.substract_funds
puts project1
puts "#{project1.name} is changing it'a name to Project ABC."
project1.name = "Project ABC"
puts project1

project2 = Project.new("Project XYZ", 75, 25)
puts project2
project2.add_funds
puts project2
puts "#{project2.name} needs $#{project2.funding_needed} to reach its target of $#{project2.target}."





