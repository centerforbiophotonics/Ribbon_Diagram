class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  royce_roles %w[
    institution-admin

    user-update
    user-destroy
    user-view
    user-set-roles
    user-approve

    diagram-update
    diagram-create
    diagram-destroy
    diagram-download
  ]

  belongs_to :institution

  validates_presence_of :institution
  validates_presence_of :name

  has_many :user_diagrams, :dependent => :delete_all
  has_many :diagrams, :through => :user_diagrams

  has_many :authored_diagrams, :class_name => "Diagram", :foreign_key => :creator_id


end
