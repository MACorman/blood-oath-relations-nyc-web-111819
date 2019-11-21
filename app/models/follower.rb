require 'pry'

class Follower
    attr_accessor :name, :age, :life_motto, :cults
    
    @cults = []
    @@followers = []
    
    def initialize(name, age, life_motto, *cults)
        @name = name
        @age = age
        @life_motto = life_motto
        @cults = cults 
        @@followers << self
    end

    def join_cult(date, cult)
        cult.recruit_follower(self)
        @cults << cult
        BloodOath.new(date,self,cult)
    end

    def self.all
        @@followers
    end

    def self.of_a_certain_age(age)
        @@followers.select { |n| n.age >= age }
    end 

    def my_cults_slogans
        array = BloodOath.all.select { |oath| oath.follower == self}
        array.map {|oath| oath.cult.slogan}
    end

    def self.most_active
        @@followers.max { |followerA, followerB| followerA.cults.length <=> followerB.cults.length }
    end

    def self.top_ten
        @@followers.max(10) { |followerA, followerB| followerA.cults.length <=> followerB.cults.length }
    end
end 

