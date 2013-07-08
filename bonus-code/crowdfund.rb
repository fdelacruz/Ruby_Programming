class Project
  def initialize(project, initial_funding, target_funding=0)
    @project = project.capitalize
    @initial_funding = initial_funding
    @target_funding = target_funding
  end

  def add
    @initial_funding += 25
    puts "#{@project} got some funds!"
  end

  def substract
    @initial_funding -= 15
    puts "#{@project} lost some funds!"
  end

  def to_s
   "#{@project} has $#{@initial_funding} in funding towards a goal of #{@target_funding}"
  end
end


project1 = Project.new("Project LMN", 500, 3000)
project2 = Project.new("Project XYZ", 25, 75)

puts project1
puts project2

project1.substract
project2.add

puts project1
puts project2





