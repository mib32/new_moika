class Subscribe < ActiveRecord::Base
  belongs_to :user
  belongs_to :car_wash
end
