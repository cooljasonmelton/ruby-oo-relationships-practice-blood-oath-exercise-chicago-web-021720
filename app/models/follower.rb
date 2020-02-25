class Follower 
    attr_accessor :name, :age, :life_motto
    @@all = []

    def initialize(name, age, motto)
        @name = name 
        @age = age
        @life_motto = motto
        @@all << self 
    end 

    def cults
        organizations = []
        BloodOath.all.each do |oath|
            if self == oath.follower
                organizations << oath.cult
            end 
        end
        organizations

        
    end 


    def join_cult(cult)
        BloodOath.new(cult, self)
    end 

    def self.all
        @@all
    end

    def self.of_a_certain_age(years)
        #takes an Integer argument that is an age and returns an Array of followers who are the given age or older
        self.all.select do |follower|
            follower.age == years
        end 
    end 

    def my_cults_slogans
        # prints out all of the slogans for this follower's cults
        #find the self's cults and put the slogan for each

        self.cults.map do |cult|
            cult.slogan
        end 



    end 

    def self.most_active
        # returns the Follower instance who has joined the most cults

        #go thru followers and select one with most cults
        #count the bloodoaths of each follower

        @@all.max do |a, b| 
        a.cults.length <=> b.cults.length
        end
    end 

    def self.top_ten
        # returns an Array of followers; they are the ten most active followers

        @@all.max(10) do |a, b| 
            a.cults.length <=> b.cults.length
            end
    end 



end 

