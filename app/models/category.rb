class Category < ApplicationRecord
  has_many :products

  has_many :sub_categories, class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent_category, class_name: Category.name, foreign_key: :parent_id, optional: true
  scope :search, ->(search) { where("name LIKE ?", "%#{search}%") if search.present? }
end
