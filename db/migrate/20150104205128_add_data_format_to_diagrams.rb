class AddDataFormatToDiagrams < ActiveRecord::Migration
  def change
    add_column :diagrams, :data_format, :string
  end
end
