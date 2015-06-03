class BookProfessor < ActiveRecord::Base
	belongs_to :professor
	belongs_to :book
end
