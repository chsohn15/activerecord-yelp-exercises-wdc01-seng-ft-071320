class Tag < ActiveRecord::Base
    has_many :dishes, through: :dish_tags

    # def self.most_common
    #     DishTag.all.each do |dish_tag|

    # end
end