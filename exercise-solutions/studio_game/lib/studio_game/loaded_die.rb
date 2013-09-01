require_relative 'auditable'

module StudioGame
  class LoadedDie
    include Auditable

    attr_reader :number

    def roll
      # numbers = [1, 1, 2, 5, 6, 6]
      # @number = numbers.sample
      @number = [1, 1, 2, 5, 6, 6].sample
      audit
      @number
    end  
  end
end
