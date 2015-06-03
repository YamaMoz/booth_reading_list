class CreatePdescriptions < ActiveRecord::Migration
  def change
    create_table :pdescriptions do |t|
      t.string :book_id
      t.string :description
      t.string :professor_id

      t.timestamps

    end
  end
end
