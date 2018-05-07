class User < ActiveRecord::Base
  has_many :userrecipes
end
