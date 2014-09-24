class Image < ActiveRecord::Base
  belongs_to :parent, polymorphic: true
  # attr_accessible :image
  mount_uploader :image, ImageUploader

  def image=(val)
    if !val.is_a?(String) && valid?
      image_will_change!
      super
    end
  end

end
