class AddDownloadableToDiagrams < ActiveRecord::Migration
  def change
    add_column :diagrams, :downloadable, :boolean, :default => false
  end
end
