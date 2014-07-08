require 'test_helper'

class PaymentSubscriptionsControllerTest < ActionController::TestCase
  setup do
    @payment_subscription = payment_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_subscription" do
    assert_difference('PaymentSubscription.count') do
      post :create, payment_subscription: { address_city: @payment_subscription.address_city, address_country: @payment_subscription.address_country, address_country_code: @payment_subscription.address_country_code, address_name: @payment_subscription.address_name, address_state: @payment_subscription.address_state, address_status: @payment_subscription.address_status, address_street: @payment_subscription.address_street, address_zip: @payment_subscription.address_zip, amount3: @payment_subscription.amount3, custom: @payment_subscription.custom, first_name: @payment_subscription.first_name, invoice: @payment_subscription.invoice, item_name: @payment_subscription.item_name, item_number: @payment_subscription.item_number, last_name: @payment_subscription.last_name, mc_amount3: @payment_subscription.mc_amount3, mc_currency: @payment_subscription.mc_currency, period3: @payment_subscription.period3, residence_country: @payment_subscription.residence_country, shipment_sent: @payment_subscription.shipment_sent, status: @payment_subscription.status, subscr_date: @payment_subscription.subscr_date, subscr_id: @payment_subscription.subscr_id, txn_type: @payment_subscription.txn_type, user_id: @payment_subscription.user_id }
    end

    assert_redirected_to payment_subscription_path(assigns(:payment_subscription))
  end

  test "should show payment_subscription" do
    get :show, id: @payment_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_subscription
    assert_response :success
  end

  test "should update payment_subscription" do
    patch :update, id: @payment_subscription, payment_subscription: { address_city: @payment_subscription.address_city, address_country: @payment_subscription.address_country, address_country_code: @payment_subscription.address_country_code, address_name: @payment_subscription.address_name, address_state: @payment_subscription.address_state, address_status: @payment_subscription.address_status, address_street: @payment_subscription.address_street, address_zip: @payment_subscription.address_zip, amount3: @payment_subscription.amount3, custom: @payment_subscription.custom, first_name: @payment_subscription.first_name, invoice: @payment_subscription.invoice, item_name: @payment_subscription.item_name, item_number: @payment_subscription.item_number, last_name: @payment_subscription.last_name, mc_amount3: @payment_subscription.mc_amount3, mc_currency: @payment_subscription.mc_currency, period3: @payment_subscription.period3, residence_country: @payment_subscription.residence_country, shipment_sent: @payment_subscription.shipment_sent, status: @payment_subscription.status, subscr_date: @payment_subscription.subscr_date, subscr_id: @payment_subscription.subscr_id, txn_type: @payment_subscription.txn_type, user_id: @payment_subscription.user_id }
    assert_redirected_to payment_subscription_path(assigns(:payment_subscription))
  end

  test "should destroy payment_subscription" do
    assert_difference('PaymentSubscription.count', -1) do
      delete :destroy, id: @payment_subscription
    end

    assert_redirected_to payment_subscriptions_path
  end
end
