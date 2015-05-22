class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User
  before_save -> { skip_confirmation! }

  has_many :businesses
end
