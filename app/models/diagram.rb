class Diagram < ActiveRecord::Base
  belongs_to :institution
  has_many :users, :through => :user_diagrams
  has_many :data_files, :dependent => :destroy

  accepts_nested_attributes_for :data_files, :reject_if => :all_blank

end
