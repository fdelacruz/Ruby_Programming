require_relative 'project'
require_relative 'die'

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
      die = Die.new
      number_rolled = die.roll
      if number_rolled.odd?
        p.substract_funds
      else
        p.add_funds
      end
      puts p
    end
  end
end
