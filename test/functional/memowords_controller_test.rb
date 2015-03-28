require 'test_helper'

class MemowordsControllerTest < ActionController::TestCase
  setup do
    @memoword = memowords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memowords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memoword" do
    assert_difference('Memoword.count') do
      post :create, memoword: { cards_ary: @memoword.cards_ary, comment: @memoword.comment, division: @memoword.division, number: @memoword.number, title: @memoword.title, user_id: @memoword.user_id }
    end

    assert_redirected_to memoword_path(assigns(:memoword))
  end

  test "should show memoword" do
    get :show, id: @memoword
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memoword
    assert_response :success
  end

  test "should update memoword" do
    put :update, id: @memoword, memoword: { cards_ary: @memoword.cards_ary, comment: @memoword.comment, division: @memoword.division, number: @memoword.number, title: @memoword.title, user_id: @memoword.user_id }
    assert_redirected_to memoword_path(assigns(:memoword))
  end

  test "should destroy memoword" do
    assert_difference('Memoword.count', -1) do
      delete :destroy, id: @memoword
    end

    assert_redirected_to memowords_path
  end
end
