require 'test_helper'

class AskingPricesControllerTest < ActionController::TestCase
  setup do
    @asking_price = asking_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asking_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asking_price" do
    assert_difference('AskingPrice.count') do
      post :create, asking_price: { price: @asking_price.price, quantity: @asking_price.quantity, sell_id: @asking_price.sell_id, skill_id: @asking_price.skill_id }
    end

    assert_redirected_to asking_price_path(assigns(:asking_price))
  end

  test "should show asking_price" do
    get :show, id: @asking_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asking_price
    assert_response :success
  end

  test "should update asking_price" do
    patch :update, id: @asking_price, asking_price: { price: @asking_price.price, quantity: @asking_price.quantity, sell_id: @asking_price.sell_id, skill_id: @asking_price.skill_id }
    assert_redirected_to asking_price_path(assigns(:asking_price))
  end

  test "should destroy asking_price" do
    assert_difference('AskingPrice.count', -1) do
      delete :destroy, id: @asking_price
    end

    assert_redirected_to asking_prices_path
  end
end
