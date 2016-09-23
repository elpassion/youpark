class AddFreeSpaceNotificationsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :free_space_notifications, :boolean, null: false, default: true
  end
end
