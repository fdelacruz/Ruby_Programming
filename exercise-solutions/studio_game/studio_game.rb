class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def name=(name)
    @name = name.capitalize
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
  
  def score
    @health + @name.length
  end

  def to_s
   "I'm #{@name} with a health of #{@health} and a score of #{score}" 
  end
end
 
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

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

player4 = Player.new("alvin")
player5 = Player.new("simon", 80)
player6 = Player.new("theodore", 100)

chipmunks = Game.new("Chipmunks")
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play
