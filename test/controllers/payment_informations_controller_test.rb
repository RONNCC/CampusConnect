require 'test_helper'

class PaymentInformationsControllerTest < ActionController::TestCase
  setup do
    @payment_information = payment_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_information" do
    assert_difference('PaymentInformation.count') do
      post :create, payment_information: { address: @payment_information.address, card_number: @payment_information.card_number, city: @payment_information.city, country: @payment_information.country, cvv_code: @payment_information.cvv_code, state: @payment_information.state, zip_code: @payment_information.zip_code }
    end

    assert_redirected_to payment_information_path(assigns(:payment_information))
  end

  test "should show payment_information" do
    get :show, id: @payment_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_information
    assert_response :success
  end

  test "should update payment_information" do
    patch :update, id: @payment_information, payment_information: { address: @payment_information.address, card_number: @payment_information.card_number, city: @payment_information.city, country: @payment_information.country, cvv_code: @payment_information.cvv_code, state: @payment_information.state, zip_code: @payment_information.zip_code }
    assert_redirected_to payment_information_path(assigns(:payment_information))
  end

  test "should destroy payment_information" do
    assert_difference('PaymentInformation.count', -1) do
      delete :destroy, id: @payment_information
    end

    assert_redirected_to payment_informations_path
  end
end
