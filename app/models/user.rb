class User < ActiveRecord::Base
    belongs_to :category
    belongs_to :sub_category
    has_many :subscriptions
    has_many :updates, foreign_key: "sender_user_id", dependent: :destroy
    has_many :recieved_updates, :class_name => "Update",
:foreign_key => "receiver_user_id", dependent: :destroy
    has_many :relationships, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_users, through: :relationships, source: :followed
    has_many :reverse_relationships, foreign_key: "followed_id", class_name:  "Relationship",  dependent:   :destroy 
    has_many :followers, through: :reverse_relationships, source: :follower
    has_many :user_sub_categories     
    has_many :sub_categories, through: :user_sub_categories, source: :sub_category

#    has_many :user_connections
#    has_many :connections, through: :user_connections, source: :sender_user

#    has_many :sent_requests, class_name: "UserConnection", foreign_key: "sender_user_id"
#    has_many :reverse_connections, through: :sent_requests, source: :user
 
    has_many :connections
    has_many :connected_users, through: :connections, source: :connected_user
    #has_many :pending_recieved_connection_requests, through: :connections, source: :connection, conditions: "status = 'pending'"
    
    has_many :albums
    has_many :uploads, through: :albums

    has_many :development_logs
    
    has_one :default_album, -> { where kind: 'default' }, class_name: 'Album'
    has_one :headshot, -> { where special_attribute: 'headshot' }, class_name: 'Upload', through: :default_album, source: :uploads
    has_many :comments
    
    before_create :create_remember_token
    
    before_save do 
      self.email = email.downcase
      self.username = username.downcase
    end
    validates :username,  presence: true, length: { maximum: 30 }, uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, length: { minimum: 6 }, on: :create
    #validates_associated :sub_category_ids, presence: true
    validates_presence_of :slug
    
    acts_as_liker 
    #is_impressionable counter_cache: true
    acts_as_mentionable
    letsrate_rater
     
    extend FriendlyId
    friendly_id :username, use: [:slugged, :finders]

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
      connection = Connection.find_by_user_id_and_connection_id(id, other_user.id) unless id == other_user.id
    end
    
    
    
    private

        def create_remember_token
            self.remember_token = User.encrypt(User.new_remember_token)
        end
end

