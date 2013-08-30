require_relative 'fundable'
require_relative 'pledge_pool'

class Project
  include Fundable

  attr_accessor :name
  attr_accessor :funding, :target

  def initialize(name, target_funding_amount, funding=0)
    @name = name
    @target = target_funding_amount
    @funding = funding
    @received_pledge = Hash.new(0)
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

  def each_received_pledge
    @received_pledge.each do |name, amount|
      yield Pledge.new(name, amount)
    end
  end
end
