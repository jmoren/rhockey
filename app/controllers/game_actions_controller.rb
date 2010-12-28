class GameActionsController < ApplicationController
  def index
    @game_actions = GameAction.all
  end
  
  def show
    @game_action = GameAction.find(params[:id])
  end
  
  def new
    @game_action = GameAction.new
  end
  
  def create
    @game_action = GameAction.new(params[:game_action])
    @game = @game_action.game
    @local = @game.local
    @visitor = @game.visitor
    @championship = @game.championship
    if @game_action.save
      @game.reload
      flash[:notice] = "Successfully created game action."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @game_action = GameAction.find(params[:id])
  end
  
  def update
    @game_action = GameAction.find(params[:id])
    if @game_action.update_attributes(params[:game_action])
      flash[:notice] = "Successfully updated game action."
      redirect_to @game_action
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @game = Game.find(params[:game_id])
    @local = @game.local
    @visitor = @game.visitor
    @championship = @game.championship
    @game_action = GameAction.find(params[:id])
    @game_action.destroy
  end
end
