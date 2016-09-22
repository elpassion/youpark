class ReservationsAddUserDateIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :reservations, [:reservation_date, :user_id], unique: true
  end
end
