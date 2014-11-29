class Request < ActiveRecord::Base
  belongs_to :car_wash
  scope :read, -> {where(read: true)}
  scope :unread, -> {where(read: false)}
  default_scope -> {order('created_at desc').order('read desc')}
end
