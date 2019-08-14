require 'test_helper'

class AllyPlacesControllerTest < ActionController::TestCase
  setup do
    @place = places(:one)
    @ally_place = ally_places(:one)
  end

  test "should get index" do
    get :index, params: { place_id: @place }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { place_id: @place }
    assert_response :success
  end

  test "should create ally_place" do
    assert_difference('AllyPlace.count') do
      post :create, params: { place_id: @place, ally_place: @ally_place.attributes }
    end

    assert_redirected_to place_ally_place_path(@place, AllyPlace.last)
  end

  test "should show ally_place" do
    get :show, params: { place_id: @place, id: @ally_place }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { place_id: @place, id: @ally_place }
    assert_response :success
  end

  test "should update ally_place" do
    put :update, params: { place_id: @place, id: @ally_place, ally_place: @ally_place.attributes }
    assert_redirected_to place_ally_place_path(@place, AllyPlace.last)
  end

  test "should destroy ally_place" do
    assert_difference('AllyPlace.count', -1) do
      delete :destroy, params: { place_id: @place, id: @ally_place }
    end

    assert_redirected_to place_ally_places_path(@place)
  end
end
