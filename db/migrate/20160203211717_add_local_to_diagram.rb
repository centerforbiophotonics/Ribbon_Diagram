class AddLocalToDiagram < ActiveRecord::Migration
  def change
    add_column :diagrams, :local, :boolean, :default => false
  end
end
