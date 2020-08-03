class Tag < ActiveRecord::Base
    has_many :dishes, through: :dish_tags
end