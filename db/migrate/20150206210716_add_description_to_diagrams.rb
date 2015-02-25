class AddDescriptionToDiagrams < ActiveRecord::Migration
  def change
    add_column :diagrams, :description, :text
  end
end
