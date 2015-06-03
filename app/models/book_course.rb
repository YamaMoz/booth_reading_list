class BookCourse < ActiveRecord::Base
	belongs_to :course
	belongs_to :book
end
