class AddDescriptionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :description, :string
    if defined? ClientVideoBanner
      ClientVideoBanner.where('filename is not null').each do |b|
        v = Video.where(url: b.filename).first
        v.update! description: b.text
      end
    end
  end
end
