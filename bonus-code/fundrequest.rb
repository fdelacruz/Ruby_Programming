require_relative 'project'

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
