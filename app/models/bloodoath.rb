require_relative 'follower.rb'
require_relative 'cult.rb'


class BloodOath
attr_accessor :initiation_date, :cult, :follower
attr_reader 
@@all = []

def initialize(cult, follower, date = Time.now)
    @cult = cult
    @follower = follower
    format_date = date.strftime("%F")
    @initiation_date = format_date
    @@all << self

end 

def self.all
    @@all
end 

def self.first_oath
    # returns the Follower instance for the follower that made the very first blood oath
    follower_date = BloodOath.all.min do |a, b| 
    a.initiation_date <=> b.initiation_date
    end 
    follower_date.follower

end 



end 
