class Institution < ActiveRecord::Base
  has_many :users
  has_many :diagrams
  has_many :access_levels
end
