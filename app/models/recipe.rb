class Recipe < ActiveRecord::Base
  has_many :user_recipes

end
