class Diagram < ActiveRecord::Base
  belongs_to :institution


  has_many :user_diagrams
  has_many :users, :through => :user_diagrams

  has_many :data_files, :dependent => :destroy

  belongs_to :creator, :class_name => "User"

  accepts_nested_attributes_for :data_files, :reject_if => :all_blank
end
