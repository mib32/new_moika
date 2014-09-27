class Video < ActiveRecord::Base
  belongs_to :car_wash
  default_scope -> { order('created_at desc')}
end
