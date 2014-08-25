class Post < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :user
  default_scope -> {order('created_at desc')}
end
