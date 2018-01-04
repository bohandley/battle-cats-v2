class UserBattleEmailMailer < ApplicationMailer
	def notify_user(user)
		@user = user
		mail(to: @user.email, subject: "Battle")
	end

	def join_battle(opponent, opponent_pet, pet)
		@opponent = opponent
		@opponent_pet = opponent_pet
		@pet = pet
		mail(to: @opponent.email, subject: "#{@opponent_pet.name} is in a battle")
	end
end
