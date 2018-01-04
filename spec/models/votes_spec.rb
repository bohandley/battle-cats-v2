require "rails_helper"

describe Vote do
  home = Dir.home
  filepath = File.join(home, "/battle-cats/public/cat1.jpg")

  let!(:user) {User.create!(email: "saham@att.net", password: "test")}
  let!(:pet) {Pet.create(name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192", owner: user)}

  let!(:new_battle) {Battle.create!()}
  let!(:pet_battle) {PetBattle.create(pet_id: pet.id, battle_id: new_battle.id, winner: "true", button_score: 50)}
  let!(:vote_1) {Vote.create(pet_id: pet.id, user_id: user.id )}

  it "has a pet id" do
      expect(vote_1.pet_id).to eq(pet.id)
  end

  it "has a user id" do
      expect(vote_1.user_id).to eq(user.id)
  end
  it "be an instance of vote" do
      expect(vote_1).to be_a_kind_of(Vote)
  end
  it "a pet has a vote" do
      expect(pet.votes.count).to eq(1)
  end

end
