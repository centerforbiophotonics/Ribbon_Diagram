class Institution < ActiveRecord::Base
  has_many :users, :dependent => :delete_all
  has_many :diagrams, :dependent => :delete_all
  has_many :access_levels, :dependent => :delete_all
end
