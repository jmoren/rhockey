require 'test_helper'

class CoachesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Coach.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Coach.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Coach.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to coach_url(assigns(:coach))
  end
  
  def test_edit
    get :edit, :id => Coach.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Coach.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Coach.first
    assert_template 'edit'
  end

  def test_update_valid
    Coach.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Coach.first
    assert_redirected_to coach_url(assigns(:coach))
  end
  
  def test_destroy
    coach = Coach.first
    delete :destroy, :id => coach
    assert_redirected_to coaches_url
    assert !Coach.exists?(coach.id)
  end
end
