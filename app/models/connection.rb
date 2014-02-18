class Connection < ActiveRecord::Base
  belongs_to :user
  belongs_to :connected_user, class_name: "User", foreign_key: "connection_id"

  def self.connection_request(user_id, connection_id)
    unless user_id == connection_id or find_by_user_id_and_connection_id(user_id, connection_id)
      transaction do
        create(:user_id => user_id, :connection_id => connection_id, :status => 'pending')
        create(:user_id => connection_id, :connection_id => user_id, :status => 'requested')
      end
    end
  end

  def self.accept(user_id, connection_id)
    transaction do
      accepted_at = Time.now
      accept_one_side(user_id, connection_id, accepted_at)
      accept_one_side(connection_id, user_id, accepted_at)
    end
  end

  def self.accept_one_side(user_id, connection_id, accepted_at)
    request = find_by_user_id_and_connection_id(user_id, connection_id)
    request.status = 'accepted'
    request.accepted_at = accepted_at
    request.save!
  end
end
