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

class FundRequest
  attr_reader :title
  
  def initialize(title)
    @title = title
    @projects = []
  end

  def add_project(a_project)
    @projects << a_project
  end

  def request_funding
    puts "\nThere are #{@projects.size} projects in #{@title}:\n"

    @projects.each do |p|
      puts p
    end

    @projects.each do |p|
      p.add_funds
      p.add_funds
      p.substract_funds
      puts p
    end
  end
end

project1 = Project.new("Project LMN", 3000, 500)
project2 = Project.new("Project XYZ", 100, 25)
project3 = Project.new("Project TBD", 1000, 300)

vc_friendly = FundRequest.new("VC-Friendly Start-up Projects")

vc_friendly.add_project(project1)
vc_friendly.add_project(project2)
vc_friendly.add_project(project3)

vc_friendly.request_funding
