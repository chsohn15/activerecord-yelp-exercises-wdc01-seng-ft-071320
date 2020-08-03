require 'faker'

Restaurant.destroy_all
Tag.destroy_all
Dish.destroy_all
DishTag.destroy_all

i = 0 
for i in 0..19
    Restaurant.create(name: Faker::Restaurant.name)
    i += 1
end

#for each restaurant, create 10 dishes in the Dish class
#with restaurant_id = restaurant.id

Restaurant.all.each do |restaurant|
    10.times {Dish.create(name: Faker::Food.dish, restaurant_id: restaurant.id)}
end

tag_array = ["spicy", "vegetarian","mild","medium spicy","dairy free", "gluten free","sugar free",
"low calorie", "vegan", "peanut free"]

tag_array.map do |tag_name|
    Tag.create(name: tag_name)
end

# For each dish, associate it with three distinct tags 
# In the dish tag table
Dish.all.each do |dish|
    3.times {DishTag.create(dish_id: dish.id, tag_id: Tag.all.uniq.sample.id)}
end





