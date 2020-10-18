# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy
  mount_uploader :image, ImageUploader

  def calculate_rating
    avr_rating = reviews.average(:rating).to_i
    update(aggregate_rating: avr_rating)
  end
end
