require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { address: @restaurant.address, delivery_charge: @restaurant.delivery_charge, description: @restaurant.description, is_active: @restaurant.is_active, minimum_order: @restaurant.minimum_order, name: @restaurant.name, phone_1: @restaurant.phone_1, phone_2: @restaurant.phone_2, picture: @restaurant.picture, qq: @restaurant.qq, qr_code: @restaurant.qr_code, star_rating: @restaurant.star_rating }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant, restaurant: { address: @restaurant.address, delivery_charge: @restaurant.delivery_charge, description: @restaurant.description, is_active: @restaurant.is_active, minimum_order: @restaurant.minimum_order, name: @restaurant.name, phone_1: @restaurant.phone_1, phone_2: @restaurant.phone_2, picture: @restaurant.picture, qq: @restaurant.qq, qr_code: @restaurant.qr_code, star_rating: @restaurant.star_rating }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
