class Votes < ActiveRecord::Migration[5.1]
  def change
  	create_table :votes do |t|
  		t.integer    :pet_id
  		t.integer    :user_id

  		t.timestamps
  	end
  end
end
