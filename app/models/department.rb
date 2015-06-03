class Department < ActiveRecord::Base
	has_many :courses

	def self.search(field,search)
    	where("#{field} like ?", "%#{search}%") 
  	end
end
