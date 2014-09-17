class Review < ActiveRecord::Base
  belongs_to :car_wash
  validates_numericality_of :rating, { greater_than_or_equal_to: 0, less_than: 6}
end
