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

  def self.accept_or_reject(user_id, connection_id, action)
    transaction do
      accepted_at = Time.now
      if action == 'accept'
        status1 = 'accepted'
        status2 = 'confirmed'
      elsif action == 'reject'
        status1 = 'rejected'
        status2 = 'got rejected'
      elsif action == 'connect'
        status1 = 'pending'
        status2 = 'requested'
      end
      accept_one_side(user_id, connection_id, accepted_at, status1)
      accept_one_side(connection_id, user_id, accepted_at, status2)
    end
  end

  def self.accept_one_side(user_id, connection_id, accepted_at, status)
    request = find_by_user_id_and_connection_id(user_id, connection_id)
    request.status = status
    request.accepted_at = accepted_at
    request.save!
  end

  def self.remove(user_id, connection_id)
    transaction do
      find_by_user_id_and_connection_id(user_id, connection_id).destroy
      find_by_user_id_and_connection_id(connection_id, user_id).destroy
    end  
  end
end
