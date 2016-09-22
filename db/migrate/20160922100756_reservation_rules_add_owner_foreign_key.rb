class ReservationRulesAddOwnerForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :reservation_rules, :owners
  end
end
