class CreateAccessLevels < ActiveRecord::Migration
  def change
    create_table :access_levels do |t|
      t.integer :code
      t.string :description
      t.integer :institution_id

      t.timestamps
    end
  end
end
