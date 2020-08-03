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
        # Find the restaurant with the most dishes
        max = 0
        max_restaurant = nil
        Restaurant.all.each do |restaurant|
            if restaurant.dishes.count > max
                max_restaurant = restaurant
                max = restaurant.dishes.count
            end
        end
        max_restaurant
    end

    def self.focused
        Restaurant.all.select do |restaurant|
           restaurant.dishes.count < 5
        end
    end
end