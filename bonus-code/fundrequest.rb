require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge_pool'
require 'CSV'

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

    pledges =  PledgePool::PLEDGES
    puts "\nThere are #{pledges.size} possible pledge amounts:"
    pledges.each do |pledge|
      puts "\t A #{pledge.name} pledge is worth $#{pledge.amount}"
    end

    1.upto(rounds) do |round|
      puts "\nFunding Round: #{round}"
      @projects.each do |project|
        FundingRound.one_round(project) 
        puts project
      end
    end
  end

  def print_name(project)
    puts "#{project.name}"
  end

  def fully_funded_projects 
    @projects.select { |project| project.fully_funded? }
  end

  def under_funded_projects 
    @projects.reject { |project| project.fully_funded? }
  end

  def sorted_under_funded_projects
    under_funded_projects.sort { |a, b| b.funding_needed <=> a.funding_needed }
  end

  def print_results
    puts "\n#{fully_funded_projects.size} fully funded projects:"
    fully_funded_projects.each do |project|
      print_name(project) 
    end

    puts "\n#{under_funded_projects.size} under funded projects:"
    under_funded_projects.each do |project|
      print_name(project) 
    end

    puts "\n#{under_funded_projects.size} projects still need your help:"
    sorted_under_funded_projects.each do |project|
      formatted_name = project.name.ljust(20, '.')
      puts "#{formatted_name} $#{project.funding_needed} under"
    end

    @projects.each do |project|
      puts "\n#{project.name}'s pledges:"
      project.each_received_pledge do |pledge|
        puts "$#{pledge.amount} in #{pledge.name} pledges"
      end
      puts "$#{project.pledges} in total pledges"
    end
  end

  def load_projects(from_file)
    CSV.foreach(from_file) do |row|     #BONUS: Ruby Standard Library
      add_project(Project.new(row[0], row[1].to_i, row[2].to_i))
    end
  end

  def save_under_funded_projects(to_file="under_funded_projects.txt")
    File.open(to_file, "w") do |file|
      file.puts "\nProjects that need funding:"
      sorted_under_funded_projects.each do |project|
        formatted_name = project.name.ljust(20, '.')
        file.puts "#{formatted_name} $#{project.funding_needed} under"
      end
    end
  end

end
