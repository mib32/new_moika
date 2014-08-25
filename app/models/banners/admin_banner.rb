class AdminBanner < Banner
  has_many :banners_configs
  def self.admin_banner_types
    {
      admin_image_banner: "Image", 
      admin_youtube_banner: "YouTube",
      admin_ivideon_banner: "Video",
      admin_slideshow_banner: "Slide"
    }
  end
end
