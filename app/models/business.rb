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

  def toggle_follow(other_business)
    if following? other_business
      unfollow other_business
    else
      follow other_business
    end
  end

  def follow(other_business)
    links.create(followed_id: other_business.id)
  end

  # Unfollows a user.
  def unfollow(other_business)
    links.find_by(followed_id: other_business.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_business)
    businesses_in_network.include?(other_business)
  end
end
