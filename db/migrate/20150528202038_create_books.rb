class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :google_description
      t.string :type
      t.integer :appearances_on_list
      t.string :img_url
      t.string :isbn_13
      t.string :year_published
      t.string :edition
      t.string :author
      t.string :title

      t.timestamps

    end
  end
end
