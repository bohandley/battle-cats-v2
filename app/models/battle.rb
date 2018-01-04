class Battle < ApplicationRecord
	has_many :pet_battles
	validates :pet_battles, length: {maximum: 2}

  def has_winner?
    if !is_tie? && set_winner != nil && set_loser != nil
      return true
    end
  end

  def set_winner
    scores = find_scores

    if !pending_battle?
      winner_pet_id = scores.key(scores.values.max)
      winner_pet_pb = self.pet_battles.select{|pb| pb.pet_id == winner_pet_id}
      winner_pet_pb[0].update_attributes(winner: true)
      return winner_pet_pb
    else
      nil 
    end
  end

  def tie
    "Game was a Tie."
  end

  def winner
    if has_winner?
      pet_battle = self.pet_battles.all.select {|petbattle| petbattle.winner == true}
      if pet_battle != [] 

        return pet_battle[0].pet
      end
    end
  end

  def is_tie?
    scores = find_scores
    return true if scores.values[0] == scores.values[1]
  end

  def set_loser
    scores = find_scores
    if !pending_battle?
      loser_pet_id = scores.key(scores.values.min)
      loser_pet_pb = self.pet_battles.select{|pb| pb.pet_id == loser_pet_id}
      loser_pet_pb[0].update_attributes(winner: false)
      return loser_pet_pb
    else
      nil
    end
  end


  def loser
    if has_winner? && !pending_battle?
      pet_battle = self.pet_battles.all.select {|petbattle| petbattle.winner == false}
      return pet_battle[0].pet
    end
  end

  def find_scores
    scores = {}
    self.pet_battles.all.each do |pb|
      #setting the key to the pet id and the value to button score
      scores[pb.pet_id] = pb.button_score
    end
    scores
  end
  def pending_battle?
    scores = find_scores
    return true if scores.values.include?(nil)
  end

  def user_not_played
    if pending_battle?
      pet_battle = self.pet_battles.all.select {|pet_battle| pet_battle.button_score == nil}
      return pet_battle[0].pet
    end
  end
end