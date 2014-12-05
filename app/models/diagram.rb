class Diagram < ActiveRecord::Base
  #has_attached_file :data_file,
  #                  :storage => :s3,
  #                  :s3_permissions => :private,
  #                  :path => "data_files/#{ Institution.find(institution_id).name }/:filename"
end
