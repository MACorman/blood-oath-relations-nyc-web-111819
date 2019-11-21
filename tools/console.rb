require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

follower1 = Follower.new('bob', 41, 'YOLO')
follower2 = Follower.new('bill', 20, 'YOLO')
follower3 = Follower.new('jeff', 15, 'YOLO')
follower4 = Follower.new('steve', 96, 'YOLO')
cult1 = Cult.new('Flatiron','Manhattan', 2009, 150, 'learnlovecode')
cult2 = Cult.new('Ironflat','Manhattan', 2009, 150, 'learnlovecode')
cult3 = Cult.new('Brooklyn','Brooklyn', 2009, 150, 'learnlovecode')
follower1.join_cult("1999-01-10",cult1)
follower2.join_cult("2006-01-01",cult2)
follower3.join_cult("1999-01-01",cult3)
follower4.join_cult("1999-11-01",cult2)
follower3.join_cult("2005-01-01",cult1)
follower3.join_cult("2010-01-01",cult2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
