require_relative 'player'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(a_player)
    @players << a_player
  end

  def play
    puts "\nThere are #{@players.size} players in #{@title}:\n"
    
    @players.each do |p|
      puts p
    end
   
    @players.each do |p|
      p.blam
      p.w00t
      p.w00t
      puts p
    end
  end
end
