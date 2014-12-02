class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :institution, index: true
      t.integer :access_level
      t.string :access_level_desc
      t.string :name

      t.timestamps
    end
  end
end
