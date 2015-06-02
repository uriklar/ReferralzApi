class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates_presence_of :invitation_id
	validates_uniqueness_of :invitation_id

  before_save -> { skip_confirmation! }

  has_one :businesses
  has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
	belongs_to :invitation
end
