class AddImageToPets < ActiveRecord::Migration[5.1]
  def change
    add_attachment :pets, :avatar
  end
end
