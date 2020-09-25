class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :source
      t.string :image_url
      t.string :reporter
      t.string :topic
      t.string :title
      t.string :date

      t.timestamps
    end
  end
end
