class CreateBookCourses < ActiveRecord::Migration
  def change
    create_table :book_courses do |t|
      t.string :course_id
      t.string :book_id

      t.timestamps

    end
  end
end
