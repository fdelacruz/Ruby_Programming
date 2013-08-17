require_relative 'pledge_pool'

class Project

  attr_accessor :name
  attr_reader :funding, :target

  def initialize(name, target_funding_amount, funding=0)
    @name = name
    @target = target_funding_amount
    @funding = funding
    @received_pledge = Hash.new(0)
  end

  def add_funds
    @funding += 25
    puts "#{@name} got some funds!"
  end

  def substract_funds
    @funding -= 15
    puts "#{@name} lost some funds!"
  end

  def funding_needed
    @target - total_funds
  end

  def fully_funded?
    funding_needed <= 0
  end

  def to_s
    "#{@name} has $#{@funding} in funding towards a goal of $#{@target}."
  end

  def received_pledge(pledge)
    @received_pledge[pledge.name] += pledge.amount
    puts "#{@name} received a #{pledge.name} worth #{pledge.amount}"
    puts "#{@name}'s pledges: #{@received_pledge}"
  end

  def pledges
    @received_pledge.values.reduce(0, :+)
  end

  def total_funds
    @funding + pledges
  end

  def each_received_pledge
    @received_pledge.each do |name, amount|
      yield Pledge.new(name, amount)
    end
  end

end
