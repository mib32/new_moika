class Service < ActiveRecord::Base
  has_many :car_washes_services
  has_many :car_washes, through: :car_washes_services

  validates :name, presence: true, uniqueness: true
end
