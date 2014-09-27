class Image < ActiveRecord::Base
  belongs_to :parent, polymorphic: true
  default_scope -> { order('created_at desc')}
  after_save :set_as_title_image

  attr_accessor :is_title_image
  mount_uploader :image, ImageUploader

  def image=(val)
    if !val.is_a?(String) && valid?
      image_will_change!
      super
    end
  end

  def set_as_title_image
    if is_title_image
      parent = parent_type.constantize.find(parent_id)
      parent.update(title_image: id)
    end
  end

end
