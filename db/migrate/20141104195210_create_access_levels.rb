  class CreateAccessLevels < ActiveRecord::Migration
  def change
    create_table :access_levels do |t|
      t.integer :code
      t.string :description
      t.belongs_to :institution

      t.timestamps
    end
  end
end
