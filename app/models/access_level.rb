class AccessLevel < ActiveRecord::Base
  belongs_to :institution
  has_many :users
end
