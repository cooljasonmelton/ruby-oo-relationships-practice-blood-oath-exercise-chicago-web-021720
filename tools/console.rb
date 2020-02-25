require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

heavensgate = Cult.new("Heaven's Gate", "comet", 2020, "let's go to heaven")
oceans11 = Cult.new("Oceans 11", "Vegas", 2015, "i want to steal money")
follower_zero = Follower.new("Roger", 23, "i love comet")
follower_one = Follower.new("Dave", 94, "i remember cold war")
follower_two = Follower.new("Sarah", 30, "coffee joke to make coworkers comfortable")
first_blood = BloodOath.new(heavensgate, follower_zero)




binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
