class RemoveAccessLevelIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :access_level_id
  end
end
