class Category < ActiveRecord::Base
  has_and_belongs_to_many :car_washes
end