class AddShareWithAllToDiagrams < ActiveRecord::Migration
  def change
    add_column :diagrams, :share_with_all, :boolean, :default => false
  end
end
