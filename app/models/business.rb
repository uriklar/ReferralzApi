class Business < ActiveRecord::Base
	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: true

  belongs_to :user
  belongs_to :category

  has_many :links, foreign_key: "follower_id", dependent:   :destroy
  has_many :businesses_in_network, through: :links,  source: :followed

  has_many :passive_links, class_name:  "Link",
                           foreign_key: "followed_id",
                           dependent:   :destroy
  has_many :followers, through: :passive_links, source: :follower

  def toggle_follow(other_business_id)
    if following? other_business_id
      unfollow other_business_id
    else
      follow other_business_id
    end
  end

  def follow(other_business_id)
    links.create(followed_id: other_business_id)
  end

  # Unfollows a user.
  def unfollow(other_business_id)
    links.find_by(followed_id: other_business_id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_business_id)
    businesses_in_network.map(&:id).include?(other_business_id)
  end
end
