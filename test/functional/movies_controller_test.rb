require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:movies)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_movie
    assert_difference('Movie.count') do
      post :create, :movie => { }
    end

    assert_redirected_to movie_path(assigns(:movie))
  end

  def test_should_show_movie
    get :show, :id => movies(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => movies(:one).id
    assert_response :success
  end

  def test_should_update_movie
    put :update, :id => movies(:one).id, :movie => { }
    assert_redirected_to movie_path(assigns(:movie))
  end

  def test_should_destroy_movie
    assert_difference('Movie.count', -1) do
      delete :destroy, :id => movies(:one).id
    end

    assert_redirected_to movies_path
  end
end
