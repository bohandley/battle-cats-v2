module PetsHelper

	def not_voted_already?(pet_id)
 		pet = Pet.find(pet_id)
		pet.votes.each do |vote_object|
  		if vote_object.user == current_user
    		return false
  		end
		end
  	return true
	end
end