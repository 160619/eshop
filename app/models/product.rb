class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  mount_uploader :image, ImageUploader

  def calculate_rating
    avr_rating = self.reviews.average(:rating).to_i
    self.update(aggregate_rating: avr_rating)
  end
end
