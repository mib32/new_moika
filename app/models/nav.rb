class Nav < ActiveRecord::Base
  validates :name, presence: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.' }

  def path_or_root
    if self.path.empty?
      '/'
    else
      self.path
    end
  end

end
