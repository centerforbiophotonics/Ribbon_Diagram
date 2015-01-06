class AddTitleAndDepartmentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :department, :string
  end
end
