class SeedAds < ActiveRecord::Migration
  def change
    10.times do 
      CubeAd.create!
      MarqueeAd.create!
    end
  end
end
