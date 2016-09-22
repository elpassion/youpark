class CreateParkingSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_spaces do |t|
      t.integer :number

      t.timestamps
    end
  end
end
