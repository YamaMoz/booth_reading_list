class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :review
      t.integer :rating
      t.string :book_id
      t.string :user_id

      t.timestamps

    end
  end
end
