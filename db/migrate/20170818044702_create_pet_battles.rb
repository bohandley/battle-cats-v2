class CreatePetBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_battles do |t|
      t.integer :pet_id, null: false 
      t.integer :battle_id, null: false 
      t.boolean :winner
      t.integer :button_score
      t.timestamps
    end
  end
end
