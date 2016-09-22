class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :parking_space, foreign_key: true
      t.references :user, foreign_key: true
      t.references :reservation_rule, foreign_key: true
      t.date :reservation_date

      t.timestamps
    end
    add_index :reservations, [:parking_space_id, :reservation_date], unique: true
  end
end
