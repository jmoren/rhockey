require 'test_helper'

class GameActionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => GameAction.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    GameAction.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GameAction.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to game_action_url(assigns(:game_action))
  end
  
  def test_edit
    get :edit, :id => GameAction.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    GameAction.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GameAction.first
    assert_template 'edit'
  end

  def test_update_valid
    GameAction.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GameAction.first
    assert_redirected_to game_action_url(assigns(:game_action))
  end
  
  def test_destroy
    game_action = GameAction.first
    delete :destroy, :id => game_action
    assert_redirected_to game_actions_url
    assert !GameAction.exists?(game_action.id)
  end
end
