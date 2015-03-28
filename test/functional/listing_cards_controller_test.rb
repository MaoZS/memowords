require 'test_helper'

class ListingCardsControllerTest < ActionController::TestCase
  setup do
    @listing_card = listing_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listing_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing_card" do
    assert_difference('ListingCard.count') do
      post :create, listing_card: { card_id: @listing_card.card_id, memorized: @listing_card.memorized, memoword_id: @listing_card.memoword_id }
    end

    assert_redirected_to listing_card_path(assigns(:listing_card))
  end

  test "should show listing_card" do
    get :show, id: @listing_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing_card
    assert_response :success
  end

  test "should update listing_card" do
    put :update, id: @listing_card, listing_card: { card_id: @listing_card.card_id, memorized: @listing_card.memorized, memoword_id: @listing_card.memoword_id }
    assert_redirected_to listing_card_path(assigns(:listing_card))
  end

  test "should destroy listing_card" do
    assert_difference('ListingCard.count', -1) do
      delete :destroy, id: @listing_card
    end

    assert_redirected_to listing_cards_path
  end
end
