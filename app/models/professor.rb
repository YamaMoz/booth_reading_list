class Professor < ActiveRecord::Base
	def self.search(field,search)
    	where("#{field} like ?", "%#{search}%") 
  	end

  	has_many :pdescriptions
end
