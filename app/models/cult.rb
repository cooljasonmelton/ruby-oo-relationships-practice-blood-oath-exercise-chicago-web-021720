require_relative 'follower.rb'
require_relative 'bloodoath.rb'

class Cult 
    attr_accessor :name, :location, :founding_year, :slogan, :followers
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name 
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self 
    end 

    def recruit_follower(follower)
    # takes in an argument of a Follower instance and adds them to this cult's list of followers
    BloodOath.new(self, follower)
    end 
    
    def cult_population
    # returns an Integer that is the number of followers in this cult
        this_cult = []

        BloodOath.all.each do |oath|
            if oath.cult == self 
                this_cult << oath.follower
            end 
        end 
        this_cult.length
    end 



    def cult_followers
        # returns an Integer that is the number of followers in this cult
            this_cult = []
    
            BloodOath.all.each do |oath|
                if oath.cult == self 
                    this_cult << oath.follower
                end 
            end 
            this_cult
        end 

    def self.all 
        @@all 
    end 

    def self.find_by_name(desired_cult)
    #takes a String argument that is a name and returns a Cult instance whose name matches that argument
        self.all.select do |cult|
            cult.name == desired_cult
        end 
    end 

    def self.find_by_location(locale)
        self.all.select do |cult|
            cult.location == locale 
        end 
    end 

    def self.find_by_founding_year(year)
    # takes an Integer argument that is a year and returns all of the cults founded in that year
        self.all.select do |cult|
            cult.founding_year == year
        end 
    end

    def average_age
        #returns a Float that is the average age of this cult's followers
        age_array = BloodOath.all.map do |oath|
            if self == oath.cult
                oath.follower.age 
            end 
        end 
        age_array.sum / age_array.length

        #self and get an array of their followers
        #map to an array of those followers ages
        #sum and divide by length   
    end 

    def my_followers_mottos
            # prints out all of the mottos for this cult's followers
            motto_array = BloodOath.all.map do |oath|
                if self == oath.cult
                    oath.follower.life_motto 
                end 
            end 
        puts motto_array

    end

    def self.least_popular
            # returns the Cult instance who has the least number of followers :(
            low_cult = Cult.all.min { |a, b| a.cult_population <=> b.cult_population }

            Cult.all.select do |cult|
                low_cult.cult_population == cult.cult_population
            end 


    end 

    def self.most_common_location
            # returns a String that is the location with the most cults

        cult_loc = Cult.all.map do |cult|
            cult.location 
        end     
        
        cult_loc.max { |a, b| cult_loc.count(a) <=> cult_loc.count(a)  }



    end





end 







# returns an Array of all the cults
# Cult.find_by_name
# takes a String argument that is a name and returns a Cult instance whose name matches that argument
# Cult.find_by_location
# takes a String argument that is a location and returns an Array of cults that are in that location
