class User < ActiveRecord::Base
#    attr_accessible :email, :name
#    include Mailboxer::Models::Messageable
#    extend Mailboxer::Models::Messageable::ActiveRecord
#    acts_as_messageable
    has_one :bussiness
    has_many :menuitems
    has_many :menucategories
    belongs_to :category
    belongs_to :sub_category
    has_many :subscriptions
    has_many :educations
    #has_many :companies
    has_many :user_tags
    has_many :tags, through: :user_tags
    has_many :user_menucategories
    has_many :menucategories, through: :user_menucategories    
    has_many :user_skills
    has_many :skills, through: :user_skills
    has_many :affiliations
    has_many :organizations
    has_many :videos
    has_many :advertisements
    has_many :quotes
    has_many :updates, foreign_key: "sender_user_id", dependent: :destroy
    has_many :recieved_updates, :class_name => "Update",
:foreign_key => "receiver_user_id", dependent: :destroy

    has_many :relationships, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_users, through: :relationships, source: :followed
    has_many :reverse_relationships, foreign_key: "followed_id", class_name:  "Relationship",  dependent:   :destroy 
    has_many :followers, through: :reverse_relationships, source: :follower

#    has_many :user_connections
#    has_many :connections, through: :user_connections, source: :sender_user

#    has_many :sent_requests, class_name: "UserConnection", foreign_key: "sender_user_id"
#    has_many :reverse_connections, through: :sent_requests, source: :user
 
    has_many :connections
    has_many :connected_users, through: :connections, source: :connected_user
    has_many :confirmed_connected_users, through: :connections, source: :connected_user, conditions: "connections.status= 'accepted' or connections.status='confirmed'"
    #has_many :pending_recieved_connection_requests, through: :connections, source: :connection, conditions: "status = 'pending'"
    #has_many :countries
    has_many :locations
    has_many :albums
    has_many :uploads, through: :albums
    has_many :covers, through: :albums
    has_one :featureimg
    has_many :development_logs
    
    has_one :default_album, -> { where kind: 'default' }, class_name: 'Album'
    has_one :status_pic_album, -> { where kind: 'status' }, class_name: 'Album'
    has_one :profile_pic_album, -> { where kind: 'profile' }, class_name: 'Album'
    has_one :cover_pic_album, -> { where kind: 'cover' }, class_name: 'Album'
    
    has_one :headshot, -> { where special_attribute: 'headshot' }, class_name: 'Upload', through: :profile_pic_album, source: :uploads
    has_one :covershot, -> { where special_attribute: 'covershot' }, class_name: 'Cover', through: :cover_pic_album, source: :covers
    
    has_many :comments
    has_many :activities
    has_many :jobs
    has_many :responses
    has_many :shares
    
    has_many :chats
    has_many :recieved_chats, class_name: 'Chat', foreign_key: 'reciever_id'
    has_many :events
    has_many :feedbacks

    has_many :conversations, :foreign_key => :sender_id
    
    before_create :create_remember_token
    
    before_save do 
      self.email = email.downcase
      self.username = username.downcase
    end
    validates :username,  presence: true, length: { maximum: 30 }, uniqueness: { case_sensitive: false }
    validates :name,  presence: true, length: { minimum: 2,  maximum: 30}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, length: { minimum: 6,  maximum: 30 }, on: :create
    validates_presence_of :category_id, presence: true
    validates_presence_of :sub_category_id, presence: true
    #validates_presence_of :slug
    validate :birthdate_custom_validate



    
    acts_as_liker 
    is_impressionable :unique => :user_id, counter_cache: true
    acts_as_mentionable
    letsrate_rater
     
    extend FriendlyId
    friendly_id :username, use: [:slugged, :finders]

    def birthdate_custom_validate
      errors.add(:birthdate, 'must be a valid date') if ((DateTime.parse(birthdate.to_s) rescue ArgumentError) == ArgumentError) and birthdate.present?
      errors.add(:birthdate, 'must be from past') if birthdate.present? and birthdate > Date.today 
    end

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
#    
#    def name
#      return "#{username}"
#    end    
#    
    private

        def create_remember_token
            self.remember_token = User.encrypt(User.new_remember_token)
        end
end

