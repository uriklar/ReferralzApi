class Link < ActiveRecord::Base
	belongs_to :follower, class_name: "Business"
  belongs_to :followed, class_name: "Business"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
