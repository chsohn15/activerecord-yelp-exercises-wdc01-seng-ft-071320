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

    def self.large_menu
        Restaurant.all.select do |restaurant|
            restaurant.dishes.count > 20
        end
    end

    def self.vegetarian
        #Find all restaurants where dishes are tagged as vegetarian
        vegetarian_tag = Tag.find_by(name: "vegetarian")
        dt = DishTag.where(tag_id: vegetarian_tag.id)
        all_dishes = dt.map do |dish_tag|
            dish_tag.dish
        end
        veg_restaurants = all_dishes.map do |dish|
            dish.restaurant
        end
        veg_restaurants.uniq
    end

    def self.name_like(name)
        Restaurant.where("name LIKE ?", "%#{name}%")
    end

    def self.name_not_like(name)
        Restaurant.where("name NOT LIKE ?", "%#{name}%")
    end

end