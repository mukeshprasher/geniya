require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { address_city: @payment.address_city, address_country: @payment.address_country, address_country_code: @payment.address_country_code, address_name: @payment.address_name, address_state: @payment.address_state, address_status: @payment.address_status, address_street: @payment.address_street, address_zip: @payment.address_zip, business: @payment.business, charset: @payment.charset, first_name: @payment.first_name, ipn_track_id: @payment.ipn_track_id, item_name: @payment.item_name, item_number: @payment.item_number, last_name: @payment.last_name, mc_currency: @payment.mc_currency, mc_fee: @payment.mc_fee, mc_gross: @payment.mc_gross, notify_version: @payment.notify_version, payer_email: @payment.payer_email, payer_id: @payment.payer_id, payer_status: @payment.payer_status, payment_date: @payment.payment_date, payment_fee: @payment.payment_fee, payment_gross: @payment.payment_gross, payment_status: @payment.payment_status, payment_subscription_id: @payment.payment_subscription_id, payment_type: @payment.payment_type, protection_eligibility: @payment.protection_eligibility, receiver_email: @payment.receiver_email, receiver_id: @payment.receiver_id, residence_country: @payment.residence_country, subscr_id: @payment.subscr_id, test_ipn: @payment.test_ipn, transaction_subject: @payment.transaction_subject, txn_id: @payment.txn_id, txn_type: @payment.txn_type, user_id: @payment.user_id, verify_sign: @payment.verify_sign }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
  end

  test "should update payment" do
    patch :update, id: @payment, payment: { address_city: @payment.address_city, address_country: @payment.address_country, address_country_code: @payment.address_country_code, address_name: @payment.address_name, address_state: @payment.address_state, address_status: @payment.address_status, address_street: @payment.address_street, address_zip: @payment.address_zip, business: @payment.business, charset: @payment.charset, first_name: @payment.first_name, ipn_track_id: @payment.ipn_track_id, item_name: @payment.item_name, item_number: @payment.item_number, last_name: @payment.last_name, mc_currency: @payment.mc_currency, mc_fee: @payment.mc_fee, mc_gross: @payment.mc_gross, notify_version: @payment.notify_version, payer_email: @payment.payer_email, payer_id: @payment.payer_id, payer_status: @payment.payer_status, payment_date: @payment.payment_date, payment_fee: @payment.payment_fee, payment_gross: @payment.payment_gross, payment_status: @payment.payment_status, payment_subscription_id: @payment.payment_subscription_id, payment_type: @payment.payment_type, protection_eligibility: @payment.protection_eligibility, receiver_email: @payment.receiver_email, receiver_id: @payment.receiver_id, residence_country: @payment.residence_country, subscr_id: @payment.subscr_id, test_ipn: @payment.test_ipn, transaction_subject: @payment.transaction_subject, txn_id: @payment.txn_id, txn_type: @payment.txn_type, user_id: @payment.user_id, verify_sign: @payment.verify_sign }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
