class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :professor_id
      t.text :description

      t.timestamps

    end
  end
end
