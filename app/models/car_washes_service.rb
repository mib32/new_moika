class CarWashesService < ActiveRecord::Base
  belongs_to :car_wash
  belongs_to :service
end