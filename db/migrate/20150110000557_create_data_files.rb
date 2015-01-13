class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.belongs_to :diagram
      t.string :name
      t.attachment :data_file
      t.timestamps
    end
  end
end
