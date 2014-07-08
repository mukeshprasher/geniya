json.array!(@payments) do |payment|
  json.extract! payment, :id, :payment_subscription_id, :user_id, :txn_id, :subscr_id, :item_name, :transaction_subject, :item_number, :receiver_email, :payer_email, :business, :payer_id, :receiver_id, :payment_date, :payment_status, :mc_gross, :payment_gross, :mc_fee, :payment_fee, :mc_currency, :protection_eligibility, :first_name, :last_name, :address_name, :address_street, :address_city, :address_state, :address_zip, :address_country_code, :address_country, :residence_country, :address_status, :payment_type, :txn_type, :payer_status, :verify_sign, :ipn_track_id, :test_ipn, :charset, :notify_version
  json.url payment_url(payment, format: :json)
end
