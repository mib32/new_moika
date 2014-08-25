class BannersConfig < ActiveRecord::Base

  belongs_to :banner
  scope :top_1, -> { where(place: 'top_1').first }
  scope :top_2, -> { where(place: 'top_2').first }
  scope :top_3, -> { where(place: 'top_3').first }
  scope :top_4, -> { where(place: 'top_4').first }
  scope :bottom_1, -> { where(place: 'bottom_1').first }
  scope :bottom_2, -> { where(place: 'bottom_2').first }
  scope :bottom_3, -> { where(place: 'bottom_3').first }
  scope :bottom_4, -> { where(place: 'bottom_4').first }
end
