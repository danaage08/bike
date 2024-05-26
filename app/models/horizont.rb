class Horizont < ApplicationRecord
	def self.ransackable_attributes(auth_object = nil)
	    ["created_at", "description", "id", "img", "title", "updated_at"]
	  end
end
