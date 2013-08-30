module Fundable
  def add_funds
    self.funding += 25
    puts "#{self.name} got some funds!"
  end

  def substract_funds
    self.funding -= 15
    puts "#{self.name} lost some funds!"
  end

  def funding_needed
    self.target - total_funds
  end

  def fully_funded?
    funding_needed <= 0
  end
  
  def total_funds
    self.funding + pledges
  end
end
