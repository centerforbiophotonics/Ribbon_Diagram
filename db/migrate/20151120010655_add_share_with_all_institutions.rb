class AddShareWithAllInstitutions < ActiveRecord::Migration
  def change
    add_column :diagrams, :share_with_all_institutions, :boolean, :default => false
  end
end
