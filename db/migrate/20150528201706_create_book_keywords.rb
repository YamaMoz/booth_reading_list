class CreateBookKeywords < ActiveRecord::Migration
  def change
    create_table :book_keywords do |t|
      t.string :keyword_id
      t.string :book_id

      t.timestamps

    end
  end
end
