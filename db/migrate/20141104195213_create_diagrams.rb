class CreateDiagrams < ActiveRecord::Migration
  def change
    create_table :diagrams do |t|
      t.belongs_to :users
      t.belongs_to :institution, :index => true
      t.integer :created_by, :null => false
      t.string :name
      t.string :category
      t.attachment :data_file
      t.timestamps
    end
  end
end
