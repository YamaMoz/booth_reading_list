class CreateBookProfessors < ActiveRecord::Migration
  def change
    create_table :book_professors do |t|
      t.string :book_id
      t.string :professor_id

      t.timestamps

    end
  end
end
