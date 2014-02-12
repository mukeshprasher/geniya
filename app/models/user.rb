class User < ActiveRecord::Base
    has_many :updates, foreign_key: "sender_user_id", dependent: :destroy
    has_many :recieved_updates, :class_name => "Update",
:foreign_key => "receiver_user_id", dependent: :destroy
    has_many :relationships, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_users, through: :relationships, source: :followed
    has_many :reverse_relationships, foreign_key: "followed_id", class_name:  "Relationship",  dependent:   :destroy 
    has_many :followers, through: :reverse_relationships, source: :follower
    has_many :user_sub_categories     
    has_many :sub_categories, :through => :user_sub_categories, :source => :sub_category

    has_many :user_connections
    has_many :connections, through: :user_connections, source: :sender_user

    has_many :sent_requests, class_name: "UserConnection", foreign_key: "sender_user_id"
    has_many :reverse_connections, through: :sent_requests, source: :user
    
    has_many :albums
    has_many :uploads, through: :albums

    before_save { self.email = email.downcase }
    before_create :create_remember_token
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
    end
    
    def feed
      Update.from_users_followed_by(self)
    end    

    def following?(other_user)
      relationships.find_by(followed_id: other_user.id)
    end

    def follow!(other_user)
      relationships.create!(followed_id: other_user.id)
    end

    def unfollow!(other_user)
      relationships.find_by(followed_id: other_user.id).destroy
    end
    
    def connected?(other_user)
      user_connections.find_by(sender_user_id: other_user.id) || sent_requests.find_by(user_id: other_user.id)
    end

    private

        def create_remember_token
            self.remember_token = User.encrypt(User.new_remember_token)
        end
end

