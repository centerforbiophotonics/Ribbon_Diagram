class UserDiagram < ActiveRecord::Base
  belongs_to :user
  belongs_to :diagram
end
