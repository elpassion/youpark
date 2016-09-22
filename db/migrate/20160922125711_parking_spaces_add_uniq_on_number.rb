class ParkingSpacesAddUniqOnNumber < ActiveRecord::Migration[5.0]
  def change
    add_index :parking_spaces, :number, unique: true
  end
end
