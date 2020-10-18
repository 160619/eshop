# frozen_string_literal: true

# Category
class Category < ApplicationRecord
  has_many :products

  has_many :sub_categories, class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent_category, class_name: Category.name, foreign_key: :parent_id, optional: true
end
