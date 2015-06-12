class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates_presence_of :invitation_id
	validates_uniqueness_of :invitation_id

  before_save -> { skip_confirmation! }
  before_validation :get_invitation, on: :create

  has_one :business
  has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
	belongs_to :invitation

  attr_accessor :invitation_code

  default_scope { includes(:business) }

  def serializable_hash(options={})
    options = { 
      :include => {
        :business => { 
          :include => [:links, :businesses_in_network] 
        }
      }
    }.update(options)
    super(options)
  end

  private


    def get_invitation
      self.invitation = Invitation.find_by_token(self.invitation_code)
    end
end
