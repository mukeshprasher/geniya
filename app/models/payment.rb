class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment_subscription
  validates :txn_id, presence: { on: :create }, uniqueness: true
end
