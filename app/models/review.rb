class Review < ActiveRecord::Base
  belongs_to :car_wash
  has_many :images, as: :parent

  accepts_nested_attributes_for :images

  validates_numericality_of :rating, { greater_than_or_equal_to: 0, less_than: 6}

end
