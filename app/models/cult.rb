require 'pry'

class Cult
    attr_accessor :name, :location, :founding_year, :slogan, :followers, :cult_population
    @@all = []

    def initialize(name, location, founding_year, cult_population, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @cult_population = cult_population
        @slogan = slogan
        @followers = []
        @@all << self
    end 

    def self.all
        @@all
    end 

    def self.find_by_name(name)
        @@all.find { |n| n.name == name }
    end

    def self.find_by_location(location)
        @@all.find { |n| n.location == location }
    end

    def self.find_by_founding_year(founding_year)
        @@all.find { |n| n.founding_year == founding_year }
    end

    def recruit_follower(follower)
        @followers << follower
        @cult_population += 1
    end

    def average_age
        new_array = followers.map{ |follower| follower.age }
        new_array.reduce(:+).to_f / new_array.length
    end

    def my_followers_mottos
        array = BloodOath.all.select { |oath| oath.cult == self }
        array.map {|oath| oath.follower.life_motto }
    end

    def self.least_popular
        @@all.min { |cultA, cultB| cultA.followers.length <=> cultB.followers.length }
    end

    def self.most_common_location
        
        freq = @@all.inject(Hash.new(0)) { |h, v| h[v]+=1; h}
        (@@all.max_by { |v| freq[v] }).location
    end

end
