class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string 	:name, null: false 
      t.string 	:animal_type, null: false 
      t.string  :bio
      t.integer :zipcode
      t.integer :owner_id, null: false 
      
      t.timestamps
    end
  end
end
