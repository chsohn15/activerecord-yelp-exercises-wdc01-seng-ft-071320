class Restaurant < ActiveRecord::Base
    has_many :dishes

    def self.mcdonalds
        Restaurant.find_by(name: 'McDonalds')
    end

    def self.tenth
        Restaurant.limit(10).last
    end

    def self.with_long_names
        Restaurant.where("length(name) >12")
    end

    def self.max_dishes
        
    end
end