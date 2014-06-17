class User < ActiveRecord::Base
  
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50 , minimum: 5}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  
  validates :password, length: { minimum: 6 } 
                   
  has_secure_password
  
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("user_id = ?", id)
    # NB - could have just had the line
    # microposts
  end
  
  def following?(other_user)
    followee(other_user)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    followee(other_user).destroy
  end
  
  private
  
    def followee(other_user)
      relationships.find_by(followed_id: other_user.id)
    end
  
end              
