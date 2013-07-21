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

  def request_funding(rounds)
    puts "\nThere are #{@projects.size} projects in #{@title}:\n"

    @projects.each do |project|
      puts project
    end

    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @projects.each do |project|
        FundingRound.one_round(project) 
        # puts project
      end
    end
  end
 
  def print_project_and_funding(project)
    puts "#{project.name} (#{project.funding})"
  end

  def print_results
    fully_funded_projects = @projects.select { |project| project.fully_funded? }
    under_funded_projects = @projects.reject { |project| project.fully_funded? }

    
    puts "\n#{fully_funded_projects.size} fully funded projects:"
    fully_funded_projects.each do |project|
      print_project_and_funding(project) 
    end

    puts "\n#{under_funded_projects.size} under funded projects:"
    under_funded_projects.each do |project|
      print_project_and_funding(project) 
    end

    puts "\n#{under_funded_projects.size} projects still need your help:"
    under_funded_projects.sort.each do |project|
      formatted_name = project.name.ljust(20, '.')
      puts "#{formatted_name} $#{project.funding_needed}"
    end
  end

end
