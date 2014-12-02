class AddInstitutionIdToDiagram < ActiveRecord::Migration
  def change
    change_table(:diagrams) do |t|
      t.belongs_to :institution, index: true
    end
  end
end
