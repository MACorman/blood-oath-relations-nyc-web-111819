require 'pry'

class BloodOath
    attr_accessor :initiation_date, :follower, :cult

    @@all = []

    def initialize(initiation_date,follower,cult)
        @initiation_date = initiation_date
        @follower = follower
        @cult = cult
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        @@all.min { |oathA, oathB| oathA.initiation_date <=> oathB.initiation_date }
    end
end
