class Course < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	validates :number, :presence => true, :uniqueness => true, format: { without: /[^0-9]/,
    message: "can only contain numbers" }, length: { is: 5, message: "must be a five digit number" }

	belongs_to :department
	has_many :book_courses

	def self.search(field,search)
    	where("#{field} LIKE '?'", search) 
  	end
end
