class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, through: :user_tags

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

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

end
