class Request < ActiveRecord::Base
  belongs_to :car_wash
  scope :read, -> {where(read: true)}
  scope :unread, -> {where(read: false)}
  default_scope -> {order('read desc').order('created_at desc')}
end
