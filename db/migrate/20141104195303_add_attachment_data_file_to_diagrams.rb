class AddAttachmentDataFileToDiagrams < ActiveRecord::Migration
  def self.up
    change_table :diagrams do |t|
      t.attachment :data_file
    end
  end

  def self.down
    remove_attachment :diagrams, :data_file
  end
end
