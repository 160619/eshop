class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name

      t.timestamps
    end
  end
end
