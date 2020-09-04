class AddAggregateRatingToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :aggregate_rating, :integer
  end
end
