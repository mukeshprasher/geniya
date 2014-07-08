json.array!(@payment_subscriptions) do |payment_subscription|
  json.extract! payment_subscription, :id, :user_id, :subscr_id, :custom, :txn_type, :subscr_date, :period3, :item_name, :item_number, :amount3, :mc_amount3, :mc_currency, :first_name, :last_name, :address_name, :address_status, :address_street, :address_city, :address_state, :address_zip, :address_country, :address_country_code, :residence_country, :status, :shipment_sent, :invoice
  json.url payment_subscription_url(payment_subscription, format: :json)
end
