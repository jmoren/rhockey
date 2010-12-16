require 'test_helper'

class ChampionshipsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Championship.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Championship.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Championship.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to championship_url(assigns(:championship))
  end
  
  def test_edit
    get :edit, :id => Championship.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Championship.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Championship.first
    assert_template 'edit'
  end

  def test_update_valid
    Championship.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Championship.first
    assert_redirected_to championship_url(assigns(:championship))
  end
  
  def test_destroy
    championship = Championship.first
    delete :destroy, :id => championship
    assert_redirected_to championships_url
    assert !Championship.exists?(championship.id)
  end
end
