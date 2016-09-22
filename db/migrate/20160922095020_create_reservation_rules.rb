class CreateReservationRules < ActiveRecord::Migration[5.0]
  def change
    create_table :reservation_rules do |t|
      t.column :owner_id, :integer, null: false
      t.column :rules, :json
      t.timestamps
    end
  end
end
