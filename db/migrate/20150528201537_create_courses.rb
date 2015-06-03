class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name_and_title
      t.string :user_id
      t.string :department_id
      t.string :name
      t.string :number

      t.timestamps

    end
  end
end
