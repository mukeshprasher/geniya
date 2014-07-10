class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :payment_subscription_id
      t.integer :user_id
      t.string :txn_id
      t.string :subscr_id
      t.string :item_name
      t.string :transaction_subject
      t.string :item_number
      t.string :receiver_email
      t.string :payer_email
      t.string :business
      t.string :payer_id
      t.string :receiver_id
      t.string :payment_date
      t.string :payment_status
      t.decimal :mc_gross
      t.decimal :payment_gross
      t.decimal :mc_fee
      t.decimal :payment_fee
      t.string :mc_currency
      t.string :protection_eligibility
      t.string :first_name
      t.string :last_name
      t.string :address_name
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :address_country_code
      t.string :address_country
      t.string :residence_country
      t.string :address_status
      t.string :payment_type
      t.string :txn_type
      t.string :payer_status
      t.string :verify_sign
      t.string :ipn_track_id
      t.string :test_ipn
      t.string :charset
      t.string :notify_version
      t.string :custom
      t.string :controller
      t.string :action

      t.timestamps
    end
  end
end
