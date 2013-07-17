require_relative 'project'
require_relative 'funding_round'

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

    @projects.each do |project|
      puts project
    end

    @projects.each do |project|
      FundingRound.take_turn(project) 
      puts project
    end
  end
end
