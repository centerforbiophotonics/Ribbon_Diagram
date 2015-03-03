class AddDoNotMailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :do_not_mail, :boolean, :default => false
  end
end
