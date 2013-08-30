require_relative 'auditable'

class Die
  include Auditable

  attr_reader :number

  # def initialize   # commented to stop the "double rolling" of the dice
  #   roll
  # end

  def roll
    @number = rand(1..6)
    audit
    @number
  end
end
