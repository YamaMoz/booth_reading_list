class Book < ActiveRecord::Base

	has_many :book_courses
	has_many :book_professors

	def self.search(field,search)
    	where("#{field} like ?", "%#{search}%") 
  	end
end