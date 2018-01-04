class PetBattle < ApplicationRecord
	belongs_to :pet
	belongs_to :battle
	after_destroy :destroy_battle
  
  	def destroy_battle
  		self.battle.destroy
  	end
end
