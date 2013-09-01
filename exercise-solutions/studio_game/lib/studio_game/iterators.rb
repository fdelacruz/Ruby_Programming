def conversation
  puts "Hello"
  yield
  puts "Goodbye"
end

def five_times
  1.upto(5) do |count| 
    yield count
  end
end

def n_times(number)
  1.upto(number) do |count| 
    yield count 
  end
end

conversation { puts "Good to meet you!" }

five_times do |n| 
  puts "#{n} situps" 
  puts "#{n} pushups" 
  puts "#{n} chinups" 
end

n_times(10) do |n| 
  puts "#{n} situps" 
  puts "#{n} pushups" 
  puts "#{n} chinups" 
end

