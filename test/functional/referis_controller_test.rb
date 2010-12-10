require 'test_helper'

class ReferisControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Referi.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Referi.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Referi.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to referi_url(assigns(:referi))
  end
  
  def test_edit
    get :edit, :id => Referi.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Referi.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Referi.first
    assert_template 'edit'
  end

  def test_update_valid
    Referi.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Referi.first
    assert_redirected_to referi_url(assigns(:referi))
  end
  
  def test_destroy
    referi = Referi.first
    delete :destroy, :id => referi
    assert_redirected_to referis_url
    assert !Referi.exists?(referi.id)
  end
end
