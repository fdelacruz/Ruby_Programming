def fund(project, funding=0)
  "#{project} has $#{funding} in funding as of #{time}"
end

def time
  current_time = Time.new
  current_time.strftime("%A %B %d, %Y")
end

puts fund("Project ABC", 1000)
puts fund("Project DEF")
puts fund("Project LMN", 750)
puts fund("Project XYZ", 500)


