class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :user_id
      t.string :name

      t.timestamps

    end
  end
end
