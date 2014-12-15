class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :institution, :index => true
      t.belongs_to :access_level, :index => true
      t.boolean :super_admin, :default => false
      t.string :name

      t.timestamps
    end
  end
end
