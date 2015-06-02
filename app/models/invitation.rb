class Invitation < ActiveRecord::Base
	belongs_to :sender, :class_name => 'User'
	has_one :recipient, :class_name => 'User'

	validates_presence_of :recipient_phone
	validates_uniqueness_of :recipient_id, :scope => :sender_id
	validate :recipient_is_not_registered

	before_create :generate_token

	private

	def recipient_is_not_registered
	  #errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
	end

	# If an invite has already been sent to this user,
	# use that invite's token. Else, generate a new one
	def generate_token
		@pending_invite = Invitation.find_by_recipient_phone(self.recipient_phone)
	  self.token = @pending_invite.try(:token) || Forgery('name').last_name + sender_id.to_s
	end
end
