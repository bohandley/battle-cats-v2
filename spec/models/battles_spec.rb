require "rails_helper"

describe Battle do
  home = Dir.home
  filepath = File.join(home, "/battle-cats/public/cat1.jpg")

  let!(:user) {User.create!(email: "saham@att.net", password: "test")}
  let!(:pet) {Pet.create(name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192")}

  let!(:new_battle) {Battle.create!()}
  let!(:pet_battle) {PetBattle.create(pet_id: pet.id, battle_id: new_battle.id, winner: "true", button_score: 50)}

  it "has a battle id" do
      expect(new_battle.id).to eq(new_battle.id)
  end

  it "is an instance of battle" do
      expect(new_battle).to be_a_kind_of(Battle)
  end


end
