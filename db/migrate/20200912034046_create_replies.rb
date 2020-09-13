class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.integer :review_id
      t.string :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
