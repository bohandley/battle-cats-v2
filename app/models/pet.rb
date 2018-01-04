class Pet < ApplicationRecord

  has_attached_file :avatar, styles: { medium: "300x300>", square: "200x200>", thumb: "100x100>" }, default_url: "https://storageforbattlecats.s3.amazonaws.com/public/default.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_size :avatar, :in => 0.megabytes..2.megabytes


  has_many :pet_battles, dependent: :destroy
	has_many :battles, through: :pet_battles
  has_many :votes, dependent: :destroy
	belongs_to :owner, class_name: "User"

	validates :name, :animal_type, :owner_id, presence: true
  validate :positivity

  def win_count
    wins = 0
    self.battles.all.each do |battle|
      if battle.winner == self
        wins += 1
      end
    end
    wins
  end
  
  def cuteness
    self.votes.count + 2
  end

  private

  def positivity
    not_positive = [
      "bitch",
      "fuck",
      "cunt",
      "dick",
      "wienermobile",
      "asshole",
      "butthole",
      "chodemaster",
      "shit",
      "piss",
      "vinegar"
    ]

    not_positive.each do |curse_word|
      if name.downcase == curse_word
        errors.add(:name, "can't be a curse word. Let's check our language, friend.")
      end
    end
  end
end