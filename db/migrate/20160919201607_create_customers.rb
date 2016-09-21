class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.column :database, :string, null: false
      t.column :name, :string, null: false
      t.timestamps
    end

    add_index :customers, :database, unique: true
  end
end