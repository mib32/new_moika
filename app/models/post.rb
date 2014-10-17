class Post < ActiveRecord::Base
  include Bootsy::Container
  # self.inheritance_column = 'inherit_of?'
  belongs_to :user
  default_scope -> {order('created_at desc')}
  # scope :news, -> {where(type: 'news')}
  # scope :info, -> {where(type: 'info')}
  belongs_to :post_category

  validates_presence_of :type



end
