require_relative 'project'

class GrantProject < Project
  def substract_funds
    @funding -= 0
    puts "#{name} funds are unchanged!"
  end
end

if __FILE__ == $0

  @grant = GrantProject.new("Grant 123", 500, 100)

  puts "#{@grant.name} has $#{@grant.total_funds} in funding towards a goal of $#{@grant.target}."
  puts "Attempting to withdraw fundings from #{@grant.name}\n"
  @grant.substract_funds
  puts "#{@grant.name} has $#{@grant.total_funds} in funding towards a goal of $#{@grant.target}."

end
