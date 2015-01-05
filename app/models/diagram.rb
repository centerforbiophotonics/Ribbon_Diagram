class Diagram < ActiveRecord::Base
  belongs_to :institution
  has_many :users, :through => :user_diagrams

  before_create :get_institution

  has_attached_file :data_file,
                    :storage => :s3,
                    :s3_permissions => :private,
                    :s3_server_side_encryption => :aes256,
                    :s3_credentials => S3_CREDENTIALS,
                    :path => "data_files/:institution/:creator_id/:filename"

  validates_attachment_content_type :data_file, :content_type => ["application/json", "text/plain", "text/csv"]

  private

  def get_institution
    self.institution = institution
  end

  Paperclip.interpolates :institution  do |attachment, style|
    attachment.instance.institution.name
  end

  Paperclip.interpolates :creator_id  do |attachment, style|
    attachment.instance.created_by
  end

end
#/#{ institution.name }