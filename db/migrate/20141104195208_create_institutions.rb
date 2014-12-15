class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name

      t.timestamps
    end

    if Rails.env == "development"
      Institution.new(:name => "Test Institution").save!
    end
  end
end
