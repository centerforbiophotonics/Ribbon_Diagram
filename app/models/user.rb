class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :institution
  belongs_to :access_level

  validates_presence_of :institution
  validates_presence_of :name

  has_many :diagrams, :through => :user_diagrams
  has_many :user_diagrams

end
