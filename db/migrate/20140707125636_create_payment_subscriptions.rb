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

      t.timestamps
    end
  end
end
