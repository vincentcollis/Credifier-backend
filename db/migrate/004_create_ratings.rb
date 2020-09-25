class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.float :score

      t.integer :rater_id
      t.integer :review_id

      t.timestamps
    end
  end
end
