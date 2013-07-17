require_relative 'die'
require_relative 'project'

module FundingRound
  def self.take_turn(project)
      die = Die.new
      number_rolled = die.roll
      if number_rolled.odd?
        project.substract_funds
      else
        project.add_funds
      end
      puts project
  end
end
