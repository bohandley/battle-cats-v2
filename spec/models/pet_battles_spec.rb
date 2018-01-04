require "rails_helper"

describe PetBattle do
  home = Dir.home
  filepath = File.join(home, "/battle-cats/public/cat1.jpg")

  let!(:user) {User.create!(email: "saham@att.net", password: "test")}
  let!(:pet) {Pet.create(name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192", owner: user)}

  let!(:new_battle) {Battle.create!()}
  let!(:pet_battle) {PetBattle.create(pet_id: pet.id, battle_id: new_battle.id, winner: "true", button_score: 50)}

  it "has a battle id" do
      expect(pet_battle.battle_id).to eq(new_battle.id)
  end

  it "has a pet id" do
      expect(pet_battle.pet_id).to eq(pet.id)
  end
  it "is a winner" do
      expect(pet_battle.winner).to be true
  end
  it "has a button_score" do
      expect(pet_battle.button_score).to eq(50)
  end

end
