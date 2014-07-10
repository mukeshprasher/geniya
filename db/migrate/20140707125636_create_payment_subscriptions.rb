class CreatePaymentSubscriptions < ActiveRecord::Migration
  def change
    create_table :payment_subscriptions do |t|
      t.integer :user_id
      t.string :subscr_id
      t.string :custom
      t.string :txn_type
      t.string :subscr_date
      t.string :period3
      t.string :item_name
      t.string :item_number
      t.string :amount3
      t.string :mc_amount3
      t.string :mc_currency
      t.string :first_name
      t.string :last_name
      t.string :address_name
      t.string :address_status
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :address_country
      t.string :address_country_code
      t.string :residence_country
      t.string :status
      t.string :shipment_sent
      t.string :invoice
      t.string :status
      t.string :business
      t.string :recurring
      t.string :verify_sign
      t.string :payer_status
      t.string :test_ipn
      t.string :payer_email
      t.string :receiver_email
      t.string :payer_id
      t.string :reattempt
      t.string :charset
      t.string :notify_version
      t.string :ipn_track_id
      t.string :transaction_subject
      t.string :payment_date
      t.string :txn_type
      t.string :payment_gross
      t.string :payment_type
      t.string :protection_eligibility
      t.string :txn_id
      t.string :receiver_id
      t.string :payment_status
      t.string :payment_fee
      t.string :mc_fee
      t.string :mc_gross
      t.string :controller
      t.string :action

      t.timestamps
    end
  end
end
