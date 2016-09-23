class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.column :provider, :integer, null: false
      t.column :token, :string, null: false
      t.column :user_id, :integer, null: false
      t.timestamps
    end

    add_index :devices, [:token, :provider], unique: true
    add_index :devices, :user_id
    add_foreign_key :devices, :users
  end
end
